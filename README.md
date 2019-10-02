# OPAL data

Setup file(s) for OPAL data server with one Elasticsearch and one Apache Fuseki instance.

## Configuration and start

- Install [Docker Compose](https://docs.docker.com/compose/install/)
- On your machine, set max_map_count=262144 (source: [Elasticsearch guide](https://www.elastic.co/guide/en/elasticsearch/reference/current/docker.html#docker-cli-run-prod-mode))
- Download or clone the GitHub repository [opaldata](https://github.com/projekt-opal/opaldata)
- Edit the configuration file  `.env`.  
  Settings:
    - `FUSEKI_ADMIN_PASSWORD`  
      Fuseki admin password for the frontend. If not set, a random password will be created.
    - `FUSEKI_JVM_ARGS`  
      Java configuration for Fuseki, e.g. the maximum heap size (Xmx).  
      Default value: `-Xmx16g`
    - `ELASTICSEARCH_JAVA_OPTS`  
      Java memory configuration for Elasticsearch.  
      Default value: `-Xms8g -Xmx8g`
- Run `docker-compose up -d`

## Access

- **Fuseki**  
  URL: `http://localhost:3030/`  
  Username: `admin`  
  Password: As set in .env file or randomly created.
- **Elasticsearch**  
  An example URL to list the available indexes:  
  http://localhost:9200/_cat/indices?v  
  An example to count datasets:  
  `curl -XGET http://localhost:9200/opal/dataset/_count`  
  An example to add a dataset:  
  `curl -H "Content-Type: application/json" -XPOST "http://localhost:9200/opal/dataset/test123" -d "{ \"title\" : \"Hello World\"}"`  
  An example to get a dataset:  
  `curl -XGET http://localhost:9200/opal/dataset/test123`  

## Notes 

* Some documentation is in the GitHub wiki: https://github.com/projekt-opal/opaldata/wiki
