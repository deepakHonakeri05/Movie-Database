# Generated by Django 2.2.4 on 2019-09-09 16:28

from django.db import migrations, models


class Migration(migrations.Migration):

    dependencies = [
        ('movie', '0002_blogs'),
    ]

    operations = [
        migrations.CreateModel(
            name='details',
            fields=[
                ('phone', models.IntegerField(primary_key=True, serialize=False)),
                ('addr', models.CharField(max_length=20)),
            ],
        ),
    ]
