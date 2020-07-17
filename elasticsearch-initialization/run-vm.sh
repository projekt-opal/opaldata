# Wait for Elasticsearch boot
echo "OPAL ES init: Waiting 20 seconds"
sleep 20

# Create index
echo "OPAL ES init: Creating index with settings"
curl -X PUT "http://elastic:changeme@elasticsearch:9200/opal?pretty" -H 'Content-Type: application/json' -d'
{
    "settings": {
        "index": {
            "max_ngram_diff": 99
        },
        "analysis": {
            "analyzer": {
                "english_text_analyzer": {
                    "type": "custom",
                    "tokenizer": "standard",
                    "char_filter": [
                        "html_strip"
                    ],
                    "filter": [
                        "lowercase",
                        "english_stemmer"
                    ]
                },
                "german_text_analyzer": {
                    "type": "custom",
                    "tokenizer": "standard",
                    "char_filter": [
                        "html_strip"
                    ],
                    "filter": [
                        "lowercase",
                        "german_stemmer",
                        "german2_stemmer"
                    ]
                },
                "ngram_url_analyzer": {
                    "type": "custom",
                    "tokenizer": "letter",
                    "char_filter": [
                        "http_remover_filter"
                    ],
                    "filter": [
                        "lowercase",
                        "1_100_gram"
                    ]
                }
            },
            "char_filter": {
                "http_remover_filter": {
                    "type": "pattern_replace",
                    "pattern": "^(http|https)://",
                    "replacement": ""
                }
            },
            "filter": {
                "english_stemmer": {
                    "type": "stemmer",
                    "language": "english"
                },
                "german_stemmer": {
                    "type": "stemmer",
                    "language": "german"
                },
                "german2_stemmer": {
                    "type": "stemmer",
                    "language": "german2"
                },
                "1_100_gram": {
                    "type": "ngram",
                    "min_gram": 1,
                    "max_gram": 100
                }
            }
        }
    }
}
'

# Create mappings
echo "OPAL ES init: Creating mappings"
curl -H 'Content-Type: application/json' -XPOST 'http://elastic:changeme@elasticsearch:9200/opal/_mapping' -d @./mappings.json
