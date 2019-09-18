# OPAL data

Setup file(s) for OPAL data server with one Elasticsearch and one Apache Fuseki instance.

## Configuration and start

- Install [Docker Compose](https://docs.docker.com/compose/install/)
- On your machine, set max_map_count=262144 (source: [Elasticsearch guide](https://www.elastic.co/guide/en/elasticsearch/reference/current/docker.html#docker-cli-run-prod-mode))
- Download or clone the GitHub repository [opaldata](https://github.com/projekt-opal/opaldata)
- Edit the configuration file  `.env`.  
  Settings:
    - `FUSEKI_ADMIN_PASSWORD`  
      If not set, a random password will be created.
    - `FUSEKI_JVM_ARGS`  
    Java configuration, e.g. the maximum heap size (Xmx), default is -Xmx16g.
- Run `docker-compose up -d`

## Access

- Fuseki  
  URL: `http://localhost:3030/`  
  Username: `admin`  
  Password: As set in .env file or randomly created.

## Notes 

* Some documentation is in the GitHub wiki: https://github.com/projekt-opal/opaldata/wiki