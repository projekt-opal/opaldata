# OPAL data

Setup file(s) for OPAL data server with one Elasticsearch and one Apache Fuseki instance.

Some documentation is in the GitHub wiki: https://github.com/projekt-opal/opaldata/wiki

## Start

- Edit the `.env` file
- Run `docker-compose up -d`

## Access

- Fuseki  
  URL: `http://localhost:3030/`  
  Username: `admin`  
  Password: `mypassword123` (or as set in .env file)