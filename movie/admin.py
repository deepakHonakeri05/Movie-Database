from django.contrib import admin
from .models import Person, iamarks, semsec
# Register your models here.
admin.site.register(Person)
admin.site.register(semsec)
admin.site.register(iamarks)