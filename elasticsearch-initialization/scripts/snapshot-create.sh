# Doc: https://www.elastic.co/guide/en/elasticsearch/reference/7.3/modules-snapshots.html

# First check snapshot-config.sh

# Check available indexes:
# http://localhost:9200/_cat/indices?v

# Took 5.6 minutes for 730 MB
curl -X PUT "localhost:9200/_snapshot/opal-snapshot/snapshot_1?wait_for_completion=true&pretty" -H 'Content-Type: application/json' -d'
{
  "indices": "opal_july"
}
'

# Should be listed here:
# http://localhost:9200/_snapshot?pretty

# Compress snapshot
# sudo docker exec -it elasticsearch_elasticsearch_1 bash -c 'tar -czf /tmp/opal-elasticsearch-snapshot.tar.gz /tmp/opal-snapshot/'

# Copy file
# sudo docker cp elasticsearch_elasticsearch_1:/tmp/opal-elasticsearch-snapshot.tar.gz ./

# Delete file in container
# sudo docker exec -it elasticsearch_elasticsearch_1 rm /tmp/opal-elasticsearch-snapshot.tar.gz

# Delete snapshot
# curl -X DELETE "localhost:9200/_snapshot/opal-snapshot/snapshot_1?pretty"
