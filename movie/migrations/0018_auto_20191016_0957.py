# Generated by Django 2.2.4 on 2019-10-16 09:57

from django.db import migrations


class Migration(migrations.Migration):

    dependencies = [
        ('movie', '0017_auto_20191016_0820'),
    ]

    operations = [
        migrations.AlterUniqueTogether(
            name='moviedirector_awards',
            unique_together={('dir_id',)},
        ),
    ]