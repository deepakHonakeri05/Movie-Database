from django.shortcuts import get_object_or_404,render
from .models import actor, director, movies, moviecast, rating, userinfo

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
			#userSigned = "signed"
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
	directorInfo = director.objects.raw('''SELECT * FROM movie_director WHERE dir_id in (SELECT dir_id from movie_movie_directedby WHERE mov_id=%s)''',[movID])
	actorInfo = actor.objects.raw('''SELECT * FROM movie_actor WHERE act_id in (SELECT act_id from movie_moviecast WHERE mov_id=%s)''',[movID])

	reviews = rating.objects.raw('''SELECT * FROM movie_rating WHERE mov_id=%s''',[movID])
	avgRating=0
	for p in reviews:
	    avgRating += p.stars

	if avgRating != 0:
	    avgRating /= len(reviews)


	return render(request, 'movie/movie_details.html', {'directorInfo':directorInfo, 'actorInfo':actorInfo, 'movie':Movie, 'reviews':reviews ,'avgRating':avgRating })

def directorDetails(request,dir_id):
	Director = None
	dirID = int(dir_id)

	Director = director.objects.raw('''SELECT * FROM movie_director WHERE  dir_id=%s''',[dirID])
	moviesInfo = movies.objects.raw('''SELECT * FROM movie_movies WHERE mov_id in (SELECT mov_id FROM movie_movie_directedby where dir_id = %s)''',[dirID])
	return render(request, 'movie/director_details.html', {'Director':Director ,'moviesInfo':moviesInfo})  # 'moviesInfo':moviesInfo

def actorDetails(request,act_id):
	Actor = None
	actID = int(act_id)

	Actor = actor.objects.raw('''SELECT * FROM movie_actor WHERE act_id =%s ''',[actID])
	castInfo = movies.objects.raw('''SELECT * FROM movie_movies WHERE mov_id in (SELECT mov_id FROM movie_moviecast where act_id = %s) ''',[actID])
	return render(request, 'movie/actor_details.html', {'Actor':Actor, 'castInfo':castInfo})

def movieRating(request,mov_id):
	global userIDGlobal
	global signInLandingPage

	movID = int(mov_id)

	user_id = userIDGlobal 
	reviewStarsQuery = request.GET.get('reviewStarsQuery')
	reviewTextQuery = request.GET.get('reviewTextQuery')

	checkReview = rating.objects.raw(''' SELECT * FROM movie_rating WHERE user_id = %s and mov_id = %s''',[user_id,movID])		

	if reviewStarsQuery and reviewTextQuery and userIDGlobal:
		cursor = connection.cursor()

		if checkReview :
			cursor.execute('''DELETE FROM movie_rating WHERE mov_id = %s and user_id=%s''',[mov_id,user_id])
			
		newReview = ''' INSERT into  movie_rating (stars,reviews,mov_id,user_id) values (%s,%s,%s,%s) '''
		cursor.execute(newReview,[reviewStarsQuery,reviewTextQuery,mov_id,user_id])
		reviewSaved = "review saved"
		signInLandingPage = 'movie/root.html'
		return  render(request, 'movie/rate_movie.html',{'reviewSaved':reviewSaved})

	elif userIDGlobal or checkReview :
		Movie = movies.objects.raw('''SELECT * FROM movie_movies WHERE mov_id = %s''',[movID])
		return render(request, 'movie/rate_movie.html',{'movie' : Movie , 'review':checkReview})		

	else :
		signInLandingPage = 'movie/rate_movie.html'
		return signIN(request)

def manageActors(request):
	actorList = actor.objects.raw('''SELECT * FROM movie_actor ''')
	return render(request,'movie/manageAllActors.html',{'actorList':actorList})

def manageDirectors(request):
	directorList = director.objects.raw('''SELECT * FROM movie_director''')
	return render(request,'movie/manageAllDirectors.html',{'directorList': directorList})

def manageMovies(request):
	movieResult = movies.objects.raw('''SELECT * FROM movie_movies order by mov_id ''')
	return render(request,'movie/manageAllMovies.html',{'movieResult':movieResult})

def addActor(request):
	actorIDQuery = request.GET.get('actorIDQuery')
	actorMovieRole = request.GET.getlist('actorMovieRole')
	actorMoviePlayed = request.GET.getlist('actorMoviePlayed')
	for movieName in actorMoviePlayed :
		for Movie in movies.objects.raw('''SELECT mov_id FROM movie_movies WHERE mov_title = %s''',[str(movieName)]) : 
			index = actorMoviePlayed.index(movieName)
			cursor.execute('''INSERT INTO movie_moviecast (role,act_id,mov_id) values (%s,%s,%s)''',[actorMovieRole[index],act_id,Movie.mov_id])
	editActor(request,actorIDQuery)

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

	cursor = connection.cursor()

	checkActor = actor.objects.raw('''SELECT * FROM movie_actor WHERE act_id=%s''',[act_id])
	
	if actorNameQuery and act_id and actorBiographyQuery and actorPicURLQuery :
		if checkActor :
			cursor.execute('''UPDATE  movie_actor SET act_name =%s ,act_gender=%s, act_bio=%s, act_picURL=%s WHERE act_id=%s''',[actorNameQuery,actorGenderQuery,actorBiographyQuery,actorPicURLQuery,act_id])
			actorSaved = "actor saved"
			for movieName in actorMoviePlayed :
				for Movie in movies.objects.raw('''SELECT mov_id FROM movie_movies WHERE mov_title = %s''',[str(movieName)]) : 
					index = actorMoviePlayed.index(movieName)
					cursor.execute('''INSERT INTO movie_moviecast (role,act_id,mov_id) values (%s,%s,%s)''',[actorMovieRole[index],act_id,Movie.mov_id])
			return render(request,'movie/edit_actor.html')

		else :
			newActor = '''INSERT into movie_actor (act_id,act_name,act_gender,act_bio,act_picURL) values (%s,%s,%s,%s,%s)'''  
			cursor.execute(newActor,[act_id,actorNameQuery,actorGenderQuery,actorBiographyQuery,actorPicURLQuery])
			actorSaved = "actor saved"
			return render(request,'movie/edit_actor.html')

	else :
		return render(request,'movie/edit_actor.html',{'actorList':checkActor})

def editDirector(request,dir_id):
	dir_id = int(dir_id)

	directorNameQuery = request.GET.get('directorNameQuery')
	dirIDQuery = request.GET.get('dirIDQuery')
	directorBioQuery = request.GET.get('directorBioQuery')
	directorPicURLQuery = request.GET.get('directorPicURLQuery')
	directorPhoneQuery = request.GET.get('directorPhoneQuery')

	cursor = connection.cursor()

	checkDirector = director.objects.raw('''SELECT * FROM movie_director WHERE dir_id=%s ''',[dir_id])
	
	if directorNameQuery and dirIDQuery and directorBioQuery and directorPicURLQuery and directorPhoneQuery :
		if checkDirector :
			cursor.execute('''UPDATE movie_director SET dir_name =%s ,  dir_phone =%s , dir_bio =%s  , dir_picURL = %s WHERE dir_id=%s ''',[directorNameQuery,directorPhoneQuery,directorBioQuery,directorPicURLQuery,dir_id])
			directorSaved = "directorSaved"	
			return render(request,'movie/edit_director.html')

		else :
			newDirector = '''INSERT INTO movie_director (dir_id,dir_name,dir_phone,dir_bio,dir_picURL) values(%s,%s,%s,%s,%s)'''
			cursor.execute(newDirector,[dirIDQuery,directorNameQuery,directorPhoneQuery,directorBioQuery,directorPicURLQuery])
			directorSaved = "directorSaved"
			return render(request,'movie/edit_director.html')
	else :
		return render(request,'movie/edit_director.html',{'directorList': checkDirector})

def editMovie(request,mov_id):
	mov_id = int(mov_id)

	movieNameQuery = request.GET.get('movieNameQuery')
	movieDescriptionQuery = request.GET.get('movieDescriptionQuery')
	moviePosterURL = request.GET.get('moviePosterURL')
	movieYearQuery = request.GET.get('movieYearQuery')
	movieLangQuery = request.GET.get('movieLangQuery')

	cursor = connection.cursor()

	checkMovie = movies.objects.raw('''SELECT * FROM movie_movies WHERE mov_id=%s''',[mov_id])

	if movieNameQuery and movieDescriptionQuery and moviePosterURL and movieYearQuery and movieLangQuery and actorMovieRole :
		if checkMovie :
			cursor.execute('''UPDATE movie_movies SET mov_title =%s ,mov_year =%s , mov_lang=%s, description=%s, movie_picurl=%s where mov_id =%s ''',[movieNameQuery,movieYearQuery,movieLangQuery,movieDescriptionQuery,moviePosterURL,mov_id])
			return render(request,'movie/add_movie.html')
		else :
			newMovie = '''INSERT INTO movie_movies(mov_id,mov_title,mov_year,mov_lang,description,movie_picurl) values (%s,%s,%s,%s,%s,%s)'''
			cursor.execute()
			return render(request,'movie/edit_movie.html')
	else:
		return render(request,'movie/edit_movie.html',{'movieResult':checkMovie})
