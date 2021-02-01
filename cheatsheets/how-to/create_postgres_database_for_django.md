# How To:
## Set Up A Postgres Database for Django
*Source:* [Grimm-Child](https://github.com/Grimm-Child/.Matrix)

#### Create a user
	CREATE USER <username> WITH PASSWORD '<password>';

#### Grant `superuser` privledges to the new user
	ALTER USER <user_name> WITH SUPERUSER;

#### Create the database
	CREATE DATABASE <db_name> OWNER <username>;

Fill in the settings files and env files with the variables created here.
