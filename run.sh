docker run --name fuseki-data -v /fuseki busybox
docker run -d -p 3030:3030 -it -e ADMIN_PASSWORD=${ADMIN_PASSWORD} --name=fuseki --volumes-from fuseki-data  stain/jena-fuseki
docker network create opalnetwork
docker run -d --name es -p 9200:9200 -p 9300:9300 --network opalnetwork -e "discovery.type=singel-node" elasticsearch:7.3.1
docker run -d --name kibana --network opalnetwork -e "ELASTICSEARCH_URL=http://es:9200" -p 5601:5601 kibana:7.3.1
