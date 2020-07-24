#sudo docker exec -ti virtuoso_opal-virtuoso_1 bash


# fuseki

#sudo docker exec -ti fuseki_opal-fuseki_1 bash

sudo docker exec -ti fuseki_opal-fuseki_1 apt-get update
sudo docker exec -ti fuseki_opal-fuseki_1 apt-get -y install wget
sudo docker exec -ti fuseki_opal-fuseki_1 wget https://hobbitdata.informatik.uni-leipzig.de/OPAL/OpalGraph/2020-07-03/mcloud_18-06-2020.tar.gz
sudo docker exec -ti fuseki_opal-fuseki_1 tar -xzf mcloud_18-06-2020.tar.gz
sudo docker exec -ti fuseki_opal-fuseki_1 rm mcloud_18-06-2020.tar.gz

# not working
#sudo docker exec -ti fuseki_opal-fuseki_1 ./tdbloader --graph=mcloud_18-06-2020 --loc=/fuseki/databases/test mcloud_18-06-2020/32e3993a_6837_443f_955c_efc0ea50a454.ttl



