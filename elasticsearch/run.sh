curl -XPUT 'http://elastic:changeme@elasticsearch:9200/opal'
curl -XPOST 'http://elastic:changeme@elasticsearch:9200/opal/dataset/_mapping' -d @./mappings.json
