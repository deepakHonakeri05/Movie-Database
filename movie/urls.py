from django.urls import path

from . import views

app_name = 'movie'

urlpatterns = [
    path('', views.root, name='root'),
    path('allMovies',views.allMovies,name='allMovies'),
    path('allDirectors',views.allDirectors,name='allDirectors'),
    path('allActors',views.allActors,name='allActors'),
    path('movieDetails/<int:usn>/',views.movieDetails)
]