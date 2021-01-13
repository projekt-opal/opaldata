# OPAL data: Fuseki

## Commands

- Build:  
  `sudo docker-compose up --build -d`
- Check file system: `sudo docker exec --interactive --tty fuseki_opal-fuseki_1 /bin/bash`


## Import data

After creating the image run the command  
`sudo docker exec --interactive --tty fuseki_opal-fuseki_1 /jena-fuseki/import.sh`  
Afterwards go to  
http://localhost:3030/manage.html  
use the link  
'add new dataset'  
and choose  
'Persistent – dataset will persist across Fuseki restarts'  
and create two databases:  
opal-2020-10  
opal-2020-06

The first command takes around 25 minutes.


## Credits

[Data Science Group (DICE)](https://dice-research.org/) at [Paderborn University](https://www.uni-paderborn.de/)

This work has been supported by the German Federal Ministry of Transport and Digital Infrastructure (BMVI) in the project [Open Data Portal Germany (OPAL)](http://projekt-opal.de/) (funding code 19F2028A).
