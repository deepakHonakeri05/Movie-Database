from django import forms

class movieSearchForm(forms.Form):
    movieSearchQuery = forms.CharField(label='movieSearchQuery', max_length=100)

class actorSearchForm(forms.Form):
    actorSearchQuery = forms.CharField(label='actorSearchQuery', max_length=100)

class directorSearchForm(forms.Form):
    directorSearchQuery = forms.CharField(label='directorSearchQuery', max_length=100)

class signInForm(forms.Form):
	useridQuery = forms.CharField(label='useridQuery', max_length=20)
	passwordQuery = forms.CharField(label='passwordQuery', max_length=20)

class signUpForm(forms.Form):
	emailQuery = forms.CharField(label='emailQuery', max_length=20)
	useridQuery = forms.CharField(label='useridQuery', max_length=20)
	passwordQuery = forms.CharField(label='passwordQuery', max_length=20)

class reviewForm(forms.Form):
	reviewStarsQuery = forms.CharField(label='reviewStarsQuery',max_length=10)
	reviewTextQuery = forms.CharField(label='reviewTextQuery',max_length=100)

class editActor(forms.Form):
	actorNameQuery = forms.CharField(label='actorNameQuery',max_length=50)
	actorIDQuery = forms.CharField(label='actorIDQuery')
	actorGenderQuery = forms.CharField(label='actorGenderQuery')
	actorBiographyQuery = forms.CharField(label='actorBiographyQuery',max_length=10000)
	actorPicURLQuery = forms.CharField(label='actorPicURLQuery',max_length=500)

class editDirector(forms.Form):
	directorNameQuery = forms.CharField(label='directorNameQuery',max_length=50)
	dirIDQuery = forms.CharField(label='dirIDQuery')
	directorBioQuery = forms.CharField(label='directorBioQuery',max_length=500)
	directorPicURLQuery = forms.CharField(label='directorPicURLQuery',max_length=500)
	directorPhoneQuery = forms.CharField(label='directorPhoneQuery')

class editMovie(forms.Form):
	movieNameQuery = forms.CharField(label='movieNameQuery',max_length=50)
	movieIDQuery = forms.CharField(label='movieIDQuery')
	movieDescriptionQuery = forms.CharField(label='movieDescriptionQuery',max_length=300)
	moviePosterURL = forms.CharField(label='moviePosterURL',max_length=100)
	movieYearQuery = forms.CharField(label='movieYearQuery')
	movieLangQuery = forms.CharField(label='movieLangQuery',max_length=30)