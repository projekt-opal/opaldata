# Doc: https://www.elastic.co/guide/en/elasticsearch/reference/7.3/modules-snapshots.html

# First check snapshot-config.sh

# Check available indexes:
# http://localhost:9200/_cat/indices?v

# opal-snapshot should be listed here:
# http://localhost:9200/_snapshot?pretty

curl -X POST "localhost:9200/_snapshot/opal-snapshot/snapshot_1/_restore?pretty" -H 'Content-Type: application/json' -d'
{
  "indices": "opal_july"
}
'

# Index should now be listed:
# http://localhost:9200/_cat/indices?v
