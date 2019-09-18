# OPAL data

Setup file(s) for OPAL data server with one Elasticsearch and one Apache Fuseki instance.

## Configuration and Start

- On your machine, set max_map_count=262144 (source: [Elasticsearch guide](https://www.elastic.co/guide/en/elasticsearch/reference/current/docker.html#docker-cli-run-prod-mode))
- Download or clone the GitHub repository [opaldata](https://github.com/projekt-opal/opaldata)
- Edit the configuration file  `.env`
- Install [Docker Compose](https://docs.docker.com/compose/install/)
- Run `docker-compose up -d`

## Access

- Fuseki  
  URL: `http://localhost:3030/`  
  Username: `admin`  
  Password: `mypassword123` (or as set in .env file)

## Notes 

* Some documentation is in the GitHub wiki: https://github.com/projekt-opal/opaldata/wiki