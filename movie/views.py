from django.shortcuts import get_object_or_404,render
from .models import actor, director, movies, moviecast, rating, userinfo

# Create your views here.
from django.http import HttpResponse,HttpResponseRedirect
from django.urls import reverse
from django.views import generic
from django.utils import timezone
from django.template import loader

from .forms import movieSearchForm, actorSearchForm, directorSearchForm


def root(request):
    template = loader.get_template("movie/root.html")
    return HttpResponse(template.render())

def signIN(request):
	user_id = request.GET.get('useridQuery')
	password = request.GET.get('passwordQuery')

	if user_id and password :
		userID = str(user_id)
		passWord = str(password)




	return render(request, '/movie/')

def signUP(request):
	template = loader.get_template("movie/signup.html")
	return HttpResponse(template.render())

def allMovies(request):
	
	movieName = request.GET.get('movieSearchQuery')

	if movieName:
		movie = '%' + str(movieName) + '%'
		movieResult = movies.objects.raw('''SELECT * FROM movie_movies where mov_title LIKE %s ''',[movie])

	else :
		movieResult = movies.objects.raw('''SELECT * FROM movie_movies ''')
		
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
		actorList = actor.objects.raw('''SELECT * FROM movie_actor''')
	
	return render(request, 'movie/allActors.html', {'actorList':actorList})

def movieDetails(request,mov_id):
	Movie = None
	movID = int(mov_id)

	Movie = movies.objects.raw('''SELECT * FROM movie_movies where mov_id = %s''',[movID])
	directorInfo = director.objects.raw('''SELECT * FROM movie_director where dir_id in (SELECT dir_id from movie_movies where mov_id=%s)''',[movID])
	#avgRating = rating.objects.raw('''SELECT avg(rev_stars) from movie_rating where mov_id = %s''',[movID])

	return render(request, 'movie/movie_details.html', {'directorInfo':directorInfo, 'movie' : Movie})

def directorDetails(request,dir_id):
	Director = None
	dirID = int(dir_id)

	Director = director.objects.raw('''SELECT * FROM movie_director where  dir_id=%s''',[dirID])
	moviesInfo = movies.objects.raw('''SELECT * FROM movie_movies where dir_id in (SELECT dir_id FROM movie_director where dir_id = %s)''',[dirID])
	return render(request, 'movie/director_details.html', {'Director':Director , 'moviesInfo':moviesInfo})

def actorDetails(request,act_id):
	Actor = None
	actID = int(act_id)

	Actor = actor.objects.raw('''SELECT * FROM movie_actor where act_id =%s ''',[actID])
	castInfo = movies.objects.raw('''SELECT * FROM movie_movies where mov_id in (SELECT mov_id FROM movie_moviecast where act_id = %s) ''',[actID])
	return render(request, 'movie/actor_details.html', {'Actor':Actor, 'castInfo':castInfo})


