# mssql-pos-migrations
Code-less Framework for doing POS (Plain-Old-SQL) Microsoft SQL Server database schema deployments. 

## Purpose

At Intelletive Consulting, we help organizations automate software builds and deployments. Unfortunately, we have discovered that it is very common for teams to be manually deploying their database schemas which makes it very difficult to fully automate their deployments. 

This script is meant to make it easy to setup and implement migrations in minutes for any legacy project that uses Microsoft SQL Server. You can fork/copy these files into your own code repository and whatever CICD tool you use and in minutes have database migrations setup using nothing but plain-old-SQL. 

## Concepts

1. Migration Scripts: A list of SQL scripts to be run and applied to the database (in order). 
2. Deployment Script: A bash script that, when run, runs all of your migrations against a database. 
3. Migrations Table: A SQL Table that is used to track which migration scripts have run in order to prevent the same script from being run twice. 

## Usage

In a build pipeline (using whatever CICD tools you use) with the postgresql client cli installed, simply run the following command, plugging in the credentials as needed: 

    export SQLCMDUSER=sa
    export SQLCMDPASSWORD=yourStrong(\!)Password
    export SQLCMDSERVER=tcp:127.0.0.1,1433
    export MSSQL_EXTRA_CLI_PARAMS=
    export MSSQL_DB=somedb
    ./run-migrations.sh

You can see the full env variable options at https://docs.microsoft.com/en-us/sql/ssms/scripting/sqlcmd-use-with-scripting-variables?view=sql-server-ver15

## Usage with Docker

If you run these commands within the context of the official mssql image, you can then run our script. 

To boot up mysql cli locally with docker: 

    docker run -it -w /data -v /$(PWD):/data mcr.microsoft.com/mssql-tools bash

And then you can run these commands like normal: 

    export SQLCMDUSER=sa
    export SQLCMDPASSWORD=yourStrong(\!)Password
    export SQLCMDSERVER=tcp:127.0.0.1,1433
    export MSSQL_EXTRA_CLI_PARAMS=
    export MSSQL_DB=somedb
    ./run-migrations.sh