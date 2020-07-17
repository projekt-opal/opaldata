# OPAL data: elasticsearch-initialization

The data in this directory is used to configure a running Elasticsearch instance.

- **create-index.sh**: Creates the Elasticsearch index *opal* and related settings.
- **create-mappings.sh**: Creates the mappings (data structure) using **mappings.json**.
- **delete-index.sh**: Deleted the Elasticsearch index *opal* and related settings and mappings. This is not required for production, but can be used for development.

Note: The synonyms configuration was removed in [commit 57537b2](https://github.com/projekt-opal/opaldata/commit/57537b271fc490e5138702234413c4a34f8d8e13).






## Credits

[Data Science Group (DICE)](https://dice-research.org/) at [Paderborn University](https://www.uni-paderborn.de/)

This work has been supported by the German Federal Ministry of Transport and Digital Infrastructure (BMVI) in the project [Open Data Portal Germany (OPAL)](http://projekt-opal.de/) (funding code 19F2028A).
