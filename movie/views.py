from django.shortcuts import get_object_or_404,render
from .models import Person, iamarks, semsec

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
	all_list = iamarks.objects.all()
	context = {'all_list': all_list}
	return render(request, 'movie/allMovies.html', context)
    # template = loader.get_template("movie/all_movies.html")
    # return HttpResponse(template.render())

def allDirectors(request):
	template = loader.get_template("movie/allDirectors.html")
	return HttpResponse(template.render())

def allActors(request):
	template = loader.get_template("movie/allActors.html")
	return HttpResponse(template.render())

def movieDetails(request,usn):
	# model = Person
	# template_name = 'movie/movie_details.html'
	template = loader.get_template("movie/movie_details.html")
	return HttpResponse(template.render())
