# Wait for Elasticsearch boot
sleep 30

# Create index
curl -XPUT 'http://elastic:changeme@elasticsearch:9200/opal'

# Create mappings
curl -H 'Content-Type: application/json' -XPOST 'http://elastic:changeme@elasticsearch:9200/opal/_mapping' -d @./mappings.json
