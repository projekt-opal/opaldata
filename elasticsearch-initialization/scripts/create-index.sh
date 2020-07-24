curl -X PUT "localhost:9200/opal?pretty" -H 'Content-Type: application/json' -d'
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

