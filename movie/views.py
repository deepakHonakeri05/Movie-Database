from django.shortcuts import get_object_or_404,render
from .models import actor, director, movies, moviecast, rating, userinfo

# Create your views here.
from django.http import HttpResponse,HttpResponseRedirect
from django.urls import reverse
from django.views import generic
from django.utils import timezone
from django.template import loader
from django.db import connection,transaction

from .forms import movieSearchForm, actorSearchForm, directorSearchForm, signInForm, signUpForm, reviewForm

userIDGlobal = None

def root(request):
	template = loader.get_template("movie/root.html")
	return HttpResponse(template.render())
	

def signIN(request):
	global userIDGlobal
	user_id = request.GET.get('useridQuery')
	password = request.GET.get('passwordQuery')

	if user_id and password :
		userID = str(user_id)
		passWord = str(password)

		selectedUser = userinfo.objects.raw('''SELECT * FROM movie_userinfo where user_id = %s and password = %s''',[userID,passWord])

		if selectedUser :
			user_id = request.GET['useridQuery']
			userIDGlobal = user_id	
			template = loader.get_template("movie/root.html")
			return HttpResponse(template.render())

		else:
			return HttpResponse("Your username and password didn't match.")

	template = loader.get_template("movie/signin.html")
	return HttpResponse(template.render())

def signUP(request):
	user_id = request.GET.get('useridQuery')
	password = request.GET.get('passwordQuery')
	email = request.GET.get('emailQuery')
	cursor = connection.cursor()


	if user_id and password and email :
		verifyUser = userinfo.objects.raw('''SELECT * FROM movie_userinfo where user_id = %s''',[user_id])

		if not verifyUser:
			newUser = ''' INSERT into  movie_userinfo values (%s,%s,%s)'''
			cursor.execute(newUser,[user_id,password,email])
			template = loader.get_template("movie/root.html")
			return HttpResponse(template.render())

		else :
			return HttpResponse("user_id is taken ...try again ")

	template = loader.get_template("movie/signup.html")
	return HttpResponse(template.render())

def logout(request):
	global userIDGlobal

	userIDGlobal = None

	template = loader.get_template("movie/root.html")
	return HttpResponse(template.render())

def allMovies(request):
	
	movieName = request.GET.get('movieSearchQuery')
	request.session['user_id'] = request.session.get('user_id')

	if movieName:
		movie = '%' + str(movieName) + '%'
		movieResult = movies.objects.raw('''SELECT * FROM movie_movies where mov_title LIKE %s order by mov_year''',[movie])

	else :
		movieResult = movies.objects.raw('''SELECT * FROM movie_movies order by mov_year ''')
		
	return render(request, 'movie/allMovies.html', {'movieResult':movieResult})

def allDirectors(request):

	dirName = request.GET.get('directorSearchQuery')

	if dirName:
		directorName = '%' + str(dirName) + '%'
		directorList = director.objects.raw('''SELECT * FROM movie_director where dir_name LIKE %s''',[directorName])

	else:
		directorList = director.objects.raw('''SELECT * FROM movie_director''')

	return render(request, 'movie/allDirectors.html', {'directorList': directorList})

def allActors(request):

	actName = request.GET.get('actorSearchQuery')

	if actName :
		actorName = '%' + str(actName) + '%'
		actorList = actor.objects.raw('''SELECT * FROM movie_actor where act_name LIKE %s''',[actorName])

	else:
		actorList = actor.objects.raw('''SELECT * FROM movie_actor ''')
	
	return render(request, 'movie/allActors.html', {'actorList':actorList})

def movieDetails(request,mov_id):
	movID = int(mov_id)

	Movie = movies.objects.raw('''SELECT * FROM movie_movies where mov_id = %s''',[movID])
	directorInfo = director.objects.raw('''SELECT * FROM movie_director where dir_id in (SELECT dir_id from movie_movie_directedby where mov_id=%s)''',[movID])
	#avgRating = rating.objects.raw('''SELECT avg(rev_stars) from movie_rating where mov_id = %s''',[movID])

	return render(request, 'movie/movie_details.html', {'directorInfo':directorInfo, 'movie' : Movie})

def directorDetails(request,dir_id):
	Director = None
	dirID = int(dir_id)

	Director = director.objects.raw('''SELECT * FROM movie_director where  dir_id=%s''',[dirID])
	moviesInfo = movies.objects.raw('''SELECT * FROM movie_movies where mov_id in (SELECT mov_id FROM movie_movie_directedby where dir_id = %s)''',[dirID])
	return render(request, 'movie/director_details.html', {'Director':Director ,'moviesInfo':moviesInfo})  # 'moviesInfo':moviesInfo

def actorDetails(request,act_id):
	Actor = None
	actID = int(act_id)

	Actor = actor.objects.raw('''SELECT * FROM movie_actor where act_id =%s ''',[actID])
	castInfo = movies.objects.raw('''SELECT * FROM movie_movies where mov_id in (SELECT mov_id FROM movie_moviecast where act_id = %s) ''',[actID])
	return render(request, 'movie/actor_details.html', {'Actor':Actor, 'castInfo':castInfo})

def movieRating(request,mov_id):
	global userIDGlobal
	movID = int(mov_id)

	user_id = userIDGlobal 
	reviewStarsQuery = request.GET.get('reviewStarsQuery')
	reviewTextQuery = request.GET.get('reviewTextQuery')

	checkReview = rating.objects.raw(''' SELECT * FROM movie_rating WHERE user_id = %s and mov_id = %s''',[user_id,movID])		

	if reviewStarsQuery and reviewTextQuery and userIDGlobal:

		if checkReview :
			#return HttpResponse("You can't rate more than once")
			cursor = connection.cursor()
			cursor.execute('''DELETE FROM movie_rating where mov_id = %s and user_id=%s''',[mov_id,user_id])
			newReview = ''' INSERT into  movie_rating (stars,reviews,mov_id,user_id) values (%s,%s,%s,%s) '''
			cursor.execute(newReview,[reviewStarsQuery,reviewTextQuery,mov_id,user_id])
			return HttpResponse("Rating saved")

		else :
			cursor = connection.cursor()
			newReview = ''' INSERT into  movie_rating (stars,reviews,mov_id,user_id) values (%s,%s,%s,%s) '''
			cursor.execute(newReview,[reviewStarsQuery,reviewTextQuery,mov_id,user_id])
			return HttpResponse("Rating saved")

	elif userIDGlobal or checkReview :
		Movie = movies.objects.raw('''SELECT * FROM movie_movies where mov_id = %s''',[movID])
		return render(request, 'movie/rate_movie.html',{'movie' : Movie , 'review':checkReview})		

	else :
		return HttpResponse("You need to log in to rate")
	