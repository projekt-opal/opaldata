# OPAL data

Setup file(s) for OPAL data server with one Elasticsearch and one Apache Fuseki instance.  
This component is used by the [OPAL converter](https://github.com/projekt-opal/converter) to store data and by [OPAL web-service](https://github.com/projekt-opal/web-service) to read data.

## Configuration and start

- Install [Docker Compose](https://docs.docker.com/compose/install/)
- On your machine, set max_map_count=262144 (source: [Elasticsearch guide](https://www.elastic.co/guide/en/elasticsearch/reference/current/docker.html#docker-cli-run-prod-mode))
- Download or clone the GitHub repository [opaldata](https://github.com/projekt-opal/opaldata)
- Edit the configuration file  `.env`.  
  Settings:
    - `FUSEKI_ADMIN_PASSWORD`  
      Fuseki admin password for the frontend. If not set, a random password will be created.  
      Testing value: `opaldata-psw`
    - `FUSEKI_JVM_ARGS`  
      Java configuration for Fuseki, e.g. the maximum heap size (Xmx).  
      Default value: `-Xmx16g`  
      Testing value: `-Xmx2g`  
    - `ELASTICSEARCH_JAVA_OPTS`  
      Java memory configuration for Elasticsearch.  
      Default value: `-Xms8g -Xmx8g`  
      Testing value: `-Xms2g -Xmx2g`  
- Run `docker-compose up -d`


## Access

- **Fuseki**  
  URL: [http://localhost:3030/](http://localhost:3030/)  
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

## Credits

[Data Science Group (DICE)](https://dice-research.org/) at [Paderborn University](https://www.uni-paderborn.de/)

This work has been supported by the German Federal Ministry of Transport and Digital Infrastructure (BMVI) in the project [Open Data Portal Germany (OPAL)](http://projekt-opal.de/) (funding code 19F2028A).
