# Doc: https://www.elastic.co/guide/en/elasticsearch/reference/7.3/modules-snapshots.html

# Command to configure path.repo
# sudo docker exec -it elasticsearch_elasticsearch_1 bash -c 'echo path.repo: [\"/tmp\"] >> /usr/share/elasticsearch/config/elasticsearch.yml'

# Restart docker container to reload config
# sudo docker restart elasticsearch_elasticsearch_1

# Config should be updated. Search for "path"
# http://localhost:9200/_nodes/?pretty

curl -X PUT "localhost:9200/_snapshot/opal-snapshot?pretty" -H 'Content-Type: application/json' -d'
{
  "type": "fs",
  "settings": {
    "location": "/tmp/opal-snapshot"
  }
}
'

# Should be visible afterwards here:
# http://localhost:9200/_snapshot/_all

# Go on with snapshot-create.sh
