from django.urls import path

from . import views

app_name = 'movie'

urlpatterns = [
    path('', views.root, name='root'),
    path('allMovies/',views.allMovies,name='allMovies'),
    path('allDirectors/',views.allDirectors,name='allDirectors'),
    path('allActors/',views.allActors,name='allActors'),
    path('movieDetails/<int:mov_id>/',views.movieDetails),
    path('rating/<int:mov_id>/',views.movieRating),
    path('directorDetails/<int:dir_id>/',views.directorDetails),
    path('actorDetails/<int:act_id>/',views.actorDetails),
    path('signin/',views.signIN),
    path('signup/',views.signUP),
    path('manageDirectors',views.manageDirectors),
    path('manageActors',views.manageActors),
    path('manageMovies',views.manageMovies),
    path('editActor/<int:act_id>/',views.editActor),
    path('editDirector/<int:dir_id>/',views.editDirector),
    path('editMovie/<int:mov_id>/',views.editMovie),
    path('addActor/',views.addActor),
    path('addMovie/',views.addMovie),
    path('addDirector/',views.addDirector),
    # path('deleteReview/<int:>')
]