from django.contrib import admin
from .models import actor, director, movies, moviecast, rating,movieactor_awards,moviedirector_awards,movie_directedby,userinfo
# Register your models here.
admin.site.register(actor)
admin.site.register(director)
admin.site.register(movieactor_awards)
admin.site.register(moviedirector_awards)
admin.site.register(movies)
admin.site.register(movie_directedby)
admin.site.register(moviecast)
admin.site.register(userinfo)
admin.site.register(rating)

