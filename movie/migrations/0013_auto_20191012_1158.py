# Generated by Django 2.2.4 on 2019-10-12 11:58

from django.db import migrations


class Migration(migrations.Migration):

    dependencies = [
        ('movie', '0012_auto_20191012_1152'),
    ]

    operations = [
        migrations.RemoveField(
            model_name='movie_directedby',
            name='height',
        ),
        migrations.RemoveField(
            model_name='movieactor_awards',
            name='height',
        ),
        migrations.RemoveField(
            model_name='moviedirector_awards',
            name='height',
        ),
    ]
