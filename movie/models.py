from django.db import models

# Create your models here.

class actor(models.Model):
	act_id = models.IntegerField(primary_key=True)
	act_name = models.CharField(max_length=50)
	act_gender = models.CharField(max_length=1)
	#act_bio = models.CharField(max_length=200)

	def __str__(self):
		return self.act_name

class director(models.Model):
	dir_id = models.IntegerField(primary_key=True)
	dir_name = models.CharField(max_length=50)
	dir_phone = models.IntegerField()
	#oscars = models.CharField(max_length=50)

	def __str__(self):
		return dir_name

class movies(models.Model):
	mov_id = models.IntegerField(primary_key=True)
	mov_title = models.CharField(max_length=50)
	mov_year = models.IntegerField()
	mov_year_lang = models.CharField(max_length=30)
	dir = models.ForeignKey(director,on_delete=models.CASCADE)
	#description = models.CharField(max_length=300)
	#url = models.CharField(max_length=100)
	def __str__(self):
		return self.mov_title

# class movie_actotr_awards(models.Model):
# 	act_id = models.IntegerField(primary_key=True)
# 	awards = models.CharField(primary_key=True)


class moviecast(models.Model):
	class Meta:
		unique_together = (("act_id", "mov_id"),)
	act_id = models.ForeignKey(actor,on_delete=models.CASCADE)
	mov_id = models.ForeignKey(movies,on_delete=models.CASCADE)
	role = models.CharField(max_length=30)

class rating(models.Model):
	class Meta:
		unique_together = (("user_id", "mov_id"),)
	user_id = models.IntegerField(primary_key=True)
	mov_id = models.ForeignKey(movies,on_delete=models.PROTECT)
	stars = models.DecimalField(max_digits=2, decimal_places=2)
	#review = models.CharField(max_length=100)

class userinfo(models.Model):
	user_id = models.CharField(primary_key=True,max_length=20)
	password = models.CharField(max_length=20)
	email = models.CharField(max_length=20)