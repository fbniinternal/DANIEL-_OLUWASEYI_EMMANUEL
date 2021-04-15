"""bankingapp URL Configuration

The `urlpatterns` list routes URLs to views. For more information please see:
    https://docs.djangoproject.com/en/3.1/topics/http/urls/
Examples:
Function views
    1. Add an import:  from my_app import views
    2. Add a URL to urlpatterns:  path('', views.home, name='home')
Class-based views
    1. Add an import:  from other_app.views import Home
    2. Add a URL to urlpatterns:  path('', Home.as_view(), name='home')
Including another URLconf
    1. Import the include() function: from django.urls import include, path
    2. Add a URL to urlpatterns:  path('blog/', include('blog.urls'))
"""
from django.contrib import admin
from django.urls import path
from account import views as ac_views

urlpatterns = [
    path('', ac_views.home, name='login'),
    path('login/', ac_views.home, name='login'),
    path('dashboard/', ac_views.dashboard, name='dashboard'),
    path('transactions/', ac_views.transactions, name='transactions'),
    path('some_view/', ac_views.some_view), 
    path("log_out/", ac_views.log_out, name="log_out"),
    path('admin/', admin.site.urls),
]
