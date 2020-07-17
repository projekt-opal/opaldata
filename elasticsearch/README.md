# OPAL data: Elasticsearch

The data in this directory is used to build and run a configured Elasticsearch instance.

The Elasticsearch index configuration is done with [elasticsearch-initialization](../elasticsearch-initialization).

You can configure the memory to be used by editing the [.env](.env) file.

Build it with:  
`sudo docker-compose up --build`  
To build it detached:  
`sudo docker-compose up --build -d`

On development errors check if existing components are unintentionally reused:  
`sudo docker image ls`  
`sudo docker volume ls`  



## Credits

[Data Science Group (DICE)](https://dice-research.org/) at [Paderborn University](https://www.uni-paderborn.de/)

This work has been supported by the German Federal Ministry of Transport and Digital Infrastructure (BMVI) in the project [Open Data Portal Germany (OPAL)](http://projekt-opal.de/) (funding code 19F2028A).
