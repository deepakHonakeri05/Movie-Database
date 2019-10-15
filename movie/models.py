from django.db import models

# Create your models here.

class actor(models.Model):
	act_id = models.IntegerField(primary_key=True)
	act_name = models.CharField(max_length=50)
	act_gender = models.CharField(max_length=1)
	act_bio = models.CharField(max_length=10000)
	act_picURL = models.CharField(max_length=500)

	def __str__(self):
		return self.act_name

class director(models.Model):
	dir_id = models.IntegerField(primary_key=True)
	dir_name = models.CharField(max_length=50)
	dir_phone = models.IntegerField()
	dir_bio = models.CharField(max_length=500)
	dir_picURL = models.CharField(max_length=500)

	def __str__(self):
		return self.dir_name

class movieactor_awards(models.Model):
	class Meta:
		unique_together = (("act_id", "awards"),)
	act_id = models.ForeignKey(actor,on_delete=models.CASCADE,db_column='act_id')
	awards = models.CharField(max_length=50)


class moviedirector_awards(models.Model):
	class Meta:
		unique_together = (("dir_id", "awards"),)
	dir_id = models.ForeignKey(director,on_delete=models.CASCADE,db_column='dir_id')  ##on delete = setnull
	awards = models.CharField(max_length=50)

class movies(models.Model):
	mov_id = models.IntegerField(primary_key=True)
	mov_title = models.CharField(max_length=50)
	mov_year = models.IntegerField()
	mov_lang = models.CharField(max_length=30)
	description = models.CharField(max_length=300)
	movie_picurl = models.CharField(max_length=100)
	def __str__(self):
		return self.mov_title

class movie_directedby(models.Model):
	class Meta:
		unique_together = (("mov_id", "dir_id"))
	mov_id = models.ForeignKey(movies,on_delete=models.CASCADE,db_column='mov_id') ##on delete = setnull
	dir_id = models.ForeignKey(director,on_delete=models.CASCADE,db_column='dir_id')  ##on delete = setnull


class moviecast(models.Model):
	class Meta:
		unique_together = (("act_id", "mov_id"),)
	act_id = models.ForeignKey(actor,on_delete=models.CASCADE,db_column='act_id')
	mov_id = models.ForeignKey(movies,on_delete=models.CASCADE,db_column='mov_id')
	role = models.CharField(max_length=30)

class userinfo(models.Model):
	user_id = models.IntegerField(primary_key=True)
	password = models.CharField(max_length=20)
	email = models.CharField(max_length=20)

class rating(models.Model):
	class Meta:
		unique_together = (("user_id", "mov_id"),)
	user_id = models.ForeignKey(userinfo,on_delete=models.CASCADE,db_column='user_id')
	mov_id = models.ForeignKey(movies,on_delete=models.PROTECT,db_column='mov_id')
	stars = models.DecimalField(max_digits=2, decimal_places=2)
	reviews = models.CharField(max_length=100)
	def __str__(self):
		return self.str(stars)