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
