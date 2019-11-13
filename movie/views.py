from django.shortcuts import get_object_or_404,render
from .models import actor, director, movies, moviecast, rating, userinfo, movie_directedby, movieactor_awards, moviedirector_awards
from django.db.utils import OperationalError
from django.shortcuts import redirect
from django.urls import reverse

# Create your views here.
from django.http import HttpResponse,HttpResponseRedirect
from django.urls import reverse
from django.views import generic
from django.utils import timezone
from django.template import loader
from django.db import connection,transaction

from .forms import movieSearchForm, actorSearchForm, directorSearchForm, signInForm, signUpForm, reviewForm, editActor, editDirector, editMovie

userIDGlobal = None
signInLandingPage = 'movie/root.html'

def root(request):
	global userIDGlobal

	userIDGlobal = None
	template = loader.get_template("movie/root.html")
	return HttpResponse(template.render())
	

def signIN(request):
	global userIDGlobal
	global signInLandingPage

	user_id = request.GET.get('useridQuery')
	password = request.GET.get('passwordQuery')

	if user_id and password :
		userID = str(user_id)
		passWord = str(password)

		selectedUser = userinfo.objects.raw('''SELECT * FROM movie_userinfo WHERE user_id = %s and password = %s''',[userID,passWord])

		if selectedUser :
			user_id = request.GET['useridQuery']
			userIDGlobal = user_id	
			userSigned = user_id
			return render(request, signInLandingPage, {'userSigned': userSigned})

		else:	
			alert = "alert"
			return render(request, 'movie/signin.html', {'alert': alert})
	else :
		template = loader.get_template("movie/signin.html")
		return HttpResponse(template.render())

def signUP(request):
	user_id = request.GET.get('useridQuery')
	password = request.GET.get('passwordQuery')
	email = request.GET.get('emailQuery')
	cursor = connection.cursor()


	if user_id and password and email :
		verifyUser = userinfo.objects.raw('''SELECT * FROM movie_userinfo WHERE user_id = %s''',[user_id])

		if not verifyUser:
			newUser = ''' INSERT into  movie_userinfo values (%s,%s,%s)'''
			cursor.execute(newUser,[user_id,password,email])
			template = loader.get_template("movie/root.html")
			return HttpResponse(template.render())

		else :
			return HttpResponse("user_id is taken ...try again ")

	else :
		template = loader.get_template("movie/signup.html")
		return HttpResponse(template.render())


def allMovies(request):
	
	movieName = request.GET.get('movieSearchQuery')
	request.session['user_id'] = request.session.get('user_id')

	if movieName:
		movie = '%' + str(movieName) + '%'
		movieResult = movies.objects.raw('''SELECT * FROM movie_movies WHERE mov_title LIKE %s order by mov_year''',[movie])

	else :
		movieResult = movies.objects.raw('''SELECT * FROM movie_movies order by mov_year ''')
		
	return render(request, 'movie/allMovies.html', {'movieResult':movieResult})

def allDirectors(request):

	dirName = request.GET.get('directorSearchQuery')

	if dirName:
		directorName = '%' + str(dirName) + '%'
		directorList = director.objects.raw('''SELECT * FROM movie_director WHERE dir_name LIKE %s''',[directorName])

	else:
		directorList = director.objects.raw('''SELECT * FROM movie_director''')

	return render(request, 'movie/allDirectors.html', {'directorList': directorList})

def allActors(request):

	actName = request.GET.get('actorSearchQuery')

	if actName :
		actorName = '%' + str(actName) + '%'
		actorList = actor.objects.raw('''SELECT * FROM movie_actor WHERE act_name LIKE %s''',[actorName])

	else:
		actorList = actor.objects.raw('''SELECT * FROM movie_actor ''')
	
	return render(request, 'movie/allActors.html', {'actorList':actorList})

def movieDetails(request,mov_id):
	global userIDGlobal
	movID = int(mov_id)

	Movie = movies.objects.raw('''SELECT * FROM movie_movies WHERE mov_id = %s''',[movID])
	directorInfo = director.objects.raw('''SELECT * FROM movie_director WHERE dir_id in (SELECT dir_id FROM movie_movie_directedby WHERE mov_id=%s)''',[movID])
	actorInfo = actor.objects.raw('''SELECT * FROM movie_actor WHERE act_id in (SELECT act_id FROM movie_moviecast WHERE mov_id=%s) order by act_id''',[movID])
	actorCastList = moviecast.objects.raw('''SELECT * FROM movie_moviecast WHERE mov_id=%s  order by act_id''',[movID])

	reviews = rating.objects.raw('''SELECT * FROM movie_rating WHERE mov_id=%s''',[movID])
	avgRating=0
	for p in reviews:
	    avgRating += p.stars

	if avgRating != 0:
	    avgRating /= len(reviews)


	return render(request, 'movie/movie_details.html', {'directorInfo':directorInfo, 'actorInfo':actorInfo,'actorCastList':actorCastList ,'movie':Movie, 'reviews':reviews ,'avgRating':avgRating })

def directorDetails(request,dir_id):
	Director = None
	dirID = int(dir_id)

	Director = director.objects.raw('''SELECT * FROM movie_director WHERE  dir_id=%s''',[dirID])
	moviesInfo = movies.objects.raw('''SELECT * FROM movie_movies WHERE mov_id in (SELECT mov_id FROM movie_movie_directedby where dir_id = %s ) order by mov_year''',[dirID])
	directorAwardsList = moviedirector_awards.objects.raw('''SELECT * FROM movie_moviedirector_awards WHERE dir_id =%s''',[dirID])
	
	return render(request, 'movie/director_details.html', {'Director':Director ,'moviesInfo':moviesInfo ,'directorAwardsList':directorAwardsList})  # 'moviesInfo':moviesInfo

def actorDetails(request,act_id):
	Actor = None
	actID = int(act_id)

	Actor = actor.objects.raw('''SELECT * FROM movie_actor WHERE act_id =%s ''',[actID])
	castInfo = movies.objects.raw('''SELECT * FROM movie_movies WHERE mov_id in (SELECT mov_id FROM movie_moviecast where act_id = %s) ''',[actID])
	actorAwardsList = movieactor_awards.objects.raw('''SELECT * FROM movie_movieactor_awards WHERE act_id=%s''',[act_id])

	return render(request, 'movie/actor_details.html', {'Actor':Actor, 'castInfo':castInfo, 'actorAwardsList':actorAwardsList})

def movieRating(request,mov_id):
	global userIDGlobal
	global signInLandingPage

	movID = int(mov_id)
	user_id = userIDGlobal

	reviewStarsQuery = request.GET.get('reviewStarsQuery')
	reviewTextQuery = request.GET.get('reviewTextQuery')

	checkReview = rating.objects.raw(''' SELECT * FROM movie_rating WHERE user_id = %s and mov_id = %s''',[user_id,movID])		

	if reviewStarsQuery and userIDGlobal:
		cursor = connection.cursor()

		if checkReview :
			cursor.execute('''DELETE FROM movie_rating WHERE mov_id = %s and user_id=%s''',[mov_id,user_id])
			
		newReview = ''' INSERT INTO  movie_rating (stars,reviews,mov_id,user_id) values (%s,%s,%s,%s) '''
		cursor.execute(newReview,[reviewStarsQuery,reviewTextQuery,mov_id,user_id])
		reviewStatus = "review saved"
		signInLandingPage = 'movie/root.html'
		return redirect('movie:movieDetails',mov_id=mov_id)

	elif userIDGlobal or checkReview :
		Movie = movies.objects.raw('''SELECT * FROM movie_movies WHERE mov_id = %s''',[movID])
		return render(request, 'movie/rate_movie.html',{'movie' : Movie , 'review':checkReview})		

	else :
		signInLandingPage = 'movie/rate_movie.html'
		return signIN(request)

def deleteReview(request,mov_title):
	global userIDGlobal

	user_id = userIDGlobal
	cursor = connection.cursor()


	for movie in movies.objects.raw('''SELECT * FROM movie_movies WHERE mov_title = %s''',[mov_title]):
		mov_id = movie.mov_id
		cursor.execute('''DELETE FROM movie_rating WHERE mov_id = %s and user_id=%s''',[mov_id,user_id])
		reviewStatus = "review deleted"
		return redirect('movie:movieDetails',mov_id=mov_id)

def manageActors(request):
	actorList = actor.objects.raw('''SELECT * FROM movie_actor order by act_id  ''')
	return render(request,'movie/manageAllActors.html',{'actorList':actorList})

def manageDirectors(request):
	directorList = director.objects.raw('''SELECT * FROM movie_director order by dir_id''')
	return render(request,'movie/manageAllDirectors.html',{'directorList': directorList})

def manageMovies(request):
	movieResult = movies.objects.raw('''SELECT * FROM movie_movies order by mov_year ''')
	return render(request,'movie/manageAllMovies.html',{'movieResult':movieResult})

def addActor(request):
	actorIDQuery = request.GET.get('actorIDQuery')
	if actorIDQuery :
	 	editActor(request,actorIDQuery)
	 	return redirect('/movie/manageActors')
	else :
		return render(request,'movie/add_actor.html') 

def editActor(request,act_id):
	act_id = int(act_id)

	actorIDQuery = request.GET.get('actorIDQuery')
	actorNameQuery = request.GET.get('actorNameQuery')
	actorBiographyQuery = request.GET.get('actorBiographyQuery')
	actorPicURLQuery = request.GET.get('actorPicURLQuery')
	actorGenderQuery = request.GET.get('actorGenderQuery')
	actorMovieRole = request.GET.getlist('actorMovieRole')
	actorMoviePlayed = request.GET.getlist('actorMoviePlayed')
	actorAwardWon = request.GET.getlist('actorAwardWon')

	cursor = connection.cursor()

	checkActor = actor.objects.raw('''SELECT * FROM movie_actor WHERE act_id=%s''',[act_id])
	actorCast = moviecast.objects.raw('''SELECT * FROM movie_moviecast WHERE act_id=%s''',[act_id])
	actorAwardsList = movieactor_awards.objects.raw('''SELECT * FROM movie_movieactor_awards WHERE act_id=%s''',[act_id])
	
	if actorNameQuery and act_id and actorBiographyQuery and actorPicURLQuery :
		if checkActor :
			cursor.execute('''UPDATE  movie_actor SET act_name =%s ,act_gender=%s, act_bio=%s, act_picURL=%s WHERE act_id=%s''',[actorNameQuery,actorGenderQuery,actorBiographyQuery,actorPicURLQuery,act_id])
			actorSaved = "actor saved"

		else :
			newActor = '''INSERT INTO movie_actor (act_id,act_name,act_gender,act_bio,act_picURL) values (%s,%s,%s,%s,%s)'''  
			cursor.execute(newActor,[act_id,actorNameQuery,actorGenderQuery,actorBiographyQuery,actorPicURLQuery])

		if actorMoviePlayed and actorMovieRole :
			cursor.execute('''DELETE FROM movie_moviecast WHERE act_id=%s ''',[act_id])
			for movieName in actorMoviePlayed :
				for Movie in movies.objects.raw('''SELECT mov_id FROM movie_movies WHERE mov_title = %s''',[str(movieName)]) : 
					index = actorMoviePlayed.index(movieName)
					cursor.execute('''INSERT INTO movie_moviecast (role,act_id,mov_id) values (%s,%s,%s)''',[actorMovieRole[index],act_id,Movie.mov_id])

		if actorAwardWon :
			cursor.execute('''DELETE FROM movie_movieactor_awards WHERE act_id=%s''',[act_id])
			for award in actorAwardWon :
				if award :
					cursor.execute('''INSERT INTO movie_movieactor_awards (act_id,awards) values (%s,%s)''',[act_id,str(award)])

		return redirect('/movie/manageActors')

	else :
		return render(request,'movie/edit_actor.html',{'actorList':checkActor , 'actorCast':actorCast , 'actorAwardsList':actorAwardsList})

def addDirector(request):
	dirIDQuery = request.GET.get('dirIDQuery')
	if dirIDQuery :
		editDirector(request,dirIDQuery)
		return redirect('/movie/manageDirectors/')
	else :
		return render(request,'movie/add_director.html')

def editDirector(request,dir_id):
	dir_id = int(dir_id)

	directorNameQuery = request.GET.get('directorNameQuery')
	dirIDQuery = request.GET.get('dirIDQuery')
	directorBioQuery = request.GET.get('directorBioQuery')
	directorPicURLQuery = request.GET.get('directorPicURLQuery')
	directorPhoneQuery = request.GET.get('directorPhoneQuery')

	movieDirected = request.GET.getlist('movieDirected')
	directorAwardWon = request.GET.getlist('directorAwardWon')

	cursor = connection.cursor()

	checkDirector = director.objects.raw('''SELECT * FROM movie_director WHERE dir_id=%s ''',[dir_id])
	moviesDirectedList = movie_directedby.objects.raw('''SELECT * FROM movie_movie_directedby WHERE dir_id = %s ''',[dir_id])
	directorAwardsList = moviedirector_awards.objects.raw('''SELECT * FROM movie_moviedirector_awards WHERE dir_id=%s''',[dir_id])
	
	if directorNameQuery and dirIDQuery and directorBioQuery and directorPicURLQuery and directorPhoneQuery :
		if checkDirector :
			cursor.execute('''UPDATE movie_director SET dir_name =%s,  dir_phone =%s, dir_bio =%s, dir_picURL = %s WHERE dir_id=%s ''',[directorNameQuery,directorPhoneQuery,directorBioQuery,directorPicURLQuery,dir_id])

		else :
			newDirector = '''INSERT INTO movie_director (dir_id,dir_name,dir_phone,dir_bio,dir_picURL) values(%s,%s,%s,%s,%s)'''
			cursor.execute(newDirector,[dirIDQuery,directorNameQuery,directorPhoneQuery,directorBioQuery,directorPicURLQuery])

		try :	
			if movieDirected :
				cursor.execute('''DELETE FROM movie_movie_directedby WHERE dir_id=%s''',[dir_id])
				for movDirected in movieDirected :
					for Movie in movies.objects.raw('''SELECT mov_id FROM movie_movies WHERE mov_title = %s''',[str(movDirected)]) :
						cursor.execute('''INSERT INTO movie_movie_directedby (dir_id,mov_id) values (%s,%s)''',[dir_id,Movie.mov_id])
		except OperationalError as e:
			return HttpResponse(str(e) + "Trigger Invoked!!!!!!!!!! \n You can't add 3 or more directors " )
			
		if directorAwardWon :
			cursor.execute('''DELETE FROM movie_moviedirector_awards  WHERE dir_id=%s''',[dir_id])
			for award in directorAwardWon :
				if award :
					cursor.execute('''INSERT INTO movie_moviedirector_awards (dir_id,awards) values (%s,%s)''',[dir_id,str(award)])
		directorAwardSaved = "directorAwardSaved"

		return redirect('/movie/manageDirectors/')
	else :
		return render(request,'movie/edit_director.html',{'directorList': checkDirector,'moviesDirectedList':moviesDirectedList,'directorAwardsList':directorAwardsList })

def addMovie(request):
	movieIDQuery = request.GET.get('movieIDQuery')
	if movieIDQuery :
		editMovie(request,movieIDQuery)
		return redirect('/movie/manageMovies/')
	else :
		return render(request,'movie/add_movie.html') 

def editMovie(request,mov_id):
	mov_id = int(mov_id)

	movieNameQuery = request.GET.get('movieNameQuery')
	movieDescriptionQuery = request.GET.get('movieDescriptionQuery')
	moviePosterURL = request.GET.get('moviePosterURL')
	movieYearQuery = request.GET.get('movieYearQuery')
	movieLangQuery = request.GET.get('movieLangQuery')

	cursor = connection.cursor()

	checkMovie = movies.objects.raw('''SELECT * FROM movie_movies WHERE mov_id=%s''',[mov_id])

	if movieNameQuery and movieDescriptionQuery and moviePosterURL and movieYearQuery and movieLangQuery :
		if checkMovie :
			cursor.execute('''UPDATE movie_movies SET mov_title =%s ,mov_year =%s , mov_lang=%s, description=%s, movie_picurl=%s where mov_id =%s ''',[movieNameQuery,movieYearQuery,movieLangQuery,movieDescriptionQuery,moviePosterURL,mov_id])

		else :
			newMovie = '''INSERT INTO movie_movies(mov_id,mov_title,mov_year,mov_lang,description,movie_picurl) values (%s,%s,%s,%s,%s,%s)'''
			cursor.execute(newMovie,[mov_id,movieNameQuery,movieYearQuery,movieLangQuery,movieDescriptionQuery,moviePosterURL])
		
		return redirect('/movie/manageMovies/')
	else:
		return render(request,'movie/edit_movie.html',{'movieResult':checkMovie})

def adminLogin(request) :
	return render(request,'movie/adminPage.html')

def manageDB(request) :
	return render(request,'movie/manageDB.html')
