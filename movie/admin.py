from django.contrib import admin
from .models import actor, director, movies, moviecast, rating
# Register your models here.
admin.site.register(actor)
admin.site.register(director)
admin.site.register(movies)
admin.site.register(moviecast)
admin.site.register(rating)
