# OPAL data

Setup for the OPAL data server with Elasticsearch and Apache Fuseki.  
This component is used by [OPAL converter](https://github.com/projekt-opal/converter) and [OPAL batch](https://github.com/projekt-opal/batch) to store data and by [OPAL web-service](https://github.com/projekt-opal/web-service) to read data.



## Configuration and start

- Install [Docker Compose](https://docs.docker.com/compose/install/)
- On your machine, set max_map_count=262144 (source: [Elasticsearch guide](https://www.elastic.co/guide/en/elasticsearch/reference/7.3/docker.html#docker-cli-run-prod-mode))
- Download or clone the GitHub repository [opaldata](https://github.com/projekt-opal/opaldata)
- Edit the configuration file  `.env`:
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
- Run `sudo docker-compose up --build -d`
- After the visible execution stopped, *opaldata_elasticsearch-initialization* will run for around 20 seconds. Its status will change from *Up* to *Exited*. You can check it by `sudo docker ps -a`.



## Access

- **Fuseki**  
  URL: [http://localhost:3030/](http://localhost:3030/)  
  Username: `admin`  
  Password: As set in .env file or randomly created
- **Elasticsearch**
    - List available indexes:
      [http://localhost:9200/_cat/indices?v](http://localhost:9200/_cat/indices?v)
    - Show mappings:
      [http://localhost:9200/opal/_mapping?pretty=true](http://localhost:9200/opal/_mapping?pretty=true)
    - Count:
      [http://localhost:9200/opal/_count?pretty=true](http://localhost:9200/opal/_count?pretty=true)
    - Search:
      [http://localhost:9200/opal/_search?q=pdf&pretty=true](http://localhost:9200/opal/_search?q=pdf&pretty=true)
    - Show (replace `ID`): [http://localhost:9200/opal/_doc/ID?pretty=true](http://localhost:9200/opal/_doc/ID?pretty=true)



## Notes 

* Some documentation is in the GitHub wiki: https://github.com/projekt-opal/opaldata/wiki
* On development errors check if existing components are unintentionally reused:  
`sudo docker image ls`  
`sudo docker volume ls`  
* Scripts to re-create the opal index are available at [elasticsearch-initialization](elasticsearch-initialization).


## Credits

[Data Science Group (DICE)](https://dice-research.org/) at [Paderborn University](https://www.uni-paderborn.de/)

This work has been supported by the German Federal Ministry of Transport and Digital Infrastructure (BMVI) in the project [Open Data Portal Germany (OPAL)](http://projekt-opal.de/) (funding code 19F2028A).
