from django.contrib.auth.models import User
from .models import *
from django.forms import ModelForm, TextInput, PasswordInput
from django.contrib.auth.models import User

class LoginForm(ModelForm):
    
    class Meta:
        model = User
        fields = ('username','password')
        widgets = {
            'username': TextInput(attrs={'class': 'form-control'}),
            'password': PasswordInput(attrs={'class': 'form-control'})
        }
        
class ProductForm(ModelForm):
    class Meta:
        model = Products
        fields = ('name',)
        
class TransactionForm(ModelForm):
    class Meta:
        model = Transactions
        fields = '__all__'
        
# class CreateUser(ModelForm):
#     username = TextInput()
#     email = TextInput()
#     first_name = TextInput()
#     last_name = TextInput()

#     class Meta:
#         model = User
#         fields = ('username', 'email', 'first_name', 'last_name')
