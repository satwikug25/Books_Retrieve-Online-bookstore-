# bookstore-412

## How to Run

Run these commands to setup environment variables:
```
$ export POSTGRESUSERNAME={whatever your postgres username is}
$ export POSTGRESPASSWORD={whatever your postgres password is}
```

Ensure that postgres is configured correctly on your machine and the server is started. In the root directory of the project, Run:
```
$ createdb bookstore
$ psql bookstore < ./database_dumps/bookstoredump.psql
```

Run the following commands in the root directory of the project to set up the python virtual environment:
```
$ pip install virtualenv
$ python3 -m venv env
$ source env/bin/activate
```

Install the required pip packages like so:
```
$ pip install -r requirements.txt
```

Run to start the api server:
```
$ python3 manage.py runserver
```