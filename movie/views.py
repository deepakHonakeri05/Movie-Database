from django.shortcuts import get_object_or_404,render
from .models import actor, director, movies, moviecast, rating

# Create your views here.
from django.http import HttpResponse,HttpResponseRedirect
from django.urls import reverse
from django.views import generic
from django.utils import timezone
from django.template import loader



def root(request):
    template = loader.get_template("movie/root.html")
    return HttpResponse(template.render())

def allMovies(request):
	all_list = movies.objects.all()
	movieList = {'all_list': all_list}
	return render(request, 'movie/allMovies.html', movieList)
    # template = loader.get_template("movie/all_movies.html")
    # return HttpResponse(template.render())

def allDirectors(request):
	all_directors = director.objects.all()
	directorList = {'all_directors': all_directors}
	return render(request, 'movie/allDirectors.html', directorList)

def allActors(request):
	all_actors = actor.objects.all()
	actorList = {'all_actors': all_actors}
	return render(request, 'movie/allActors.html', actorList)

def movieDetails(request,mov_id):
	movie = None
	movid = int(mov_id)

	movie = movies.objects.filter(mov_id=movid)

	return render(request, 'movie/movie_details.html', {'movie' : movie})

def directorDetails(request,dir_id):
	template = loader.get_template("movie/director_details.html")
	return HttpResponse(template.render())

def actorDetails(request,act_id):
	template = loader.get_template("movie/actor_details.html")
	return HttpResponse(template.render())