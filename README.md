# DANIEL-_OLUWASEYI_EMMANUEL
DANIEL,_OLUWASEYI_EMMANUEL

*Setup*
1. `run $ pip install -r requirements.txt` to install project requirements.
2. Database settings: the database settings can be modified in bankingapp/settings.py file.
The following lines can be editted to suite the MySQL, Oracle, or PostgreSQL, though the setting here is adapted for MYSQL

`DATABASES = {
    'default': {
        'ENGINE': 'django.db.backends.mysql',
        'NAME': Database_name,
        'USER': DB_User,
        'PASSWORD': Password,
        'HOST': Host,
        'PORT': Port,
    }
}`
The demo SQL file 'bankingapp.sql' may be used for testing the app.

4. To start the development server, run `python manage.py runserver`, once the development server is started, the app can be accessed ath `localhost:8000`
