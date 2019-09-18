# OPAL data

Setup file(s) for OPAL data server with one Elasticsearch and one Apache Fuseki instance.

Some documentation is in the GitHub wiki: https://github.com/projekt-opal/opaldata/wiki

## Start

- Edit the `.env` file
- The vm.max_map_count setting should be set permanently (at least 262144) in /etc/sysctl.conf
- Run `docker-compose up -d`

## Access

- Fuseki  
  URL: `http://localhost:3030/`  
  Username: `admin`  
  Password: `mypassword123` (or as set in .env file)
