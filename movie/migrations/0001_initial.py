# Generated by Django 2.2.4 on 2019-09-09 15:47

from django.db import migrations, models


class Migration(migrations.Migration):

    initial = True

    dependencies = [
    ]

    operations = [
        migrations.CreateModel(
            name='Person',
            fields=[
                ('id', models.AutoField(auto_created=True, primary_key=True, serialize=False, verbose_name='ID')),
                ('uidPerson', models.IntegerField()),
                ('namePerson', models.CharField(max_length=20)),
            ],
        ),
    ]
