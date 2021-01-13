# OPAL data Fuseki
#
# Configuration of the base image is described here:
#  https://hub.docker.com/r/stain/jena-fuseki
#
# Base image code:
#  https://github.com/stain/jena-docker/tree/jena-3.14.0-2
#
# Issues on the Dockerfile:
#  https://github.com/stain/jena-docker/issues
#
# Fix: apt-get install -y --no-install-recommends procps
#  java.io.IOException: Cannot run program "ps": error=2, No such file or directory
#  org.apache.jena.assembler.exceptions.AssemblerException: caught: Process ID 7 can't open database at location /fuseki/databases/opal/ because it is already locked by the process with PID 8
#  https://github.com/stain/jena-docker/issues/34#issuecomment-598138012
#
# Data persistence
#  From the stain readme:
#  To store the data in a named Docker volume container fuseki-data (recommended), create it first as:
#  docker run --name fuseki-data -v /fuseki busybox
#
# Useful commands
#  sudo docker-compose up --build -d
#  sudo docker exec --interactive --tty fuseki_opal-fuseki_1 /bin/bash
#
#
# IMPORT DATA
# After creating the image run the command
#  sudo docker exec --interactive --tty fuseki_opal-fuseki_1 /jena-fuseki/import.sh
# Afterwards go to 
#  http://localhost:3030/manage.html
# use the link
#  'add new dataset'
# and choose
#  'Persistent – dataset will persist across Fuseki restarts'
# and create two databases:
#  opal-2020-10
#  opal-2020-06

FROM stain/jena-fuseki:3.14.0

# Install packages
RUN \
apt-get update -y && \
apt-get install -y wget axel && \
apt-get install -y --no-install-recommends procps


# Download data
RUN \
mkdir /tmp/opal-2020-10 && \
cd /tmp/opal-2020-10 && \
axel https://hobbitdata.informatik.uni-leipzig.de/OPAL/OpalGraph/2020-11-18/2020-10/mdm-1.ttl.tar.gz && \
axel https://hobbitdata.informatik.uni-leipzig.de/OPAL/OpalGraph/2020-11-18/2020-10/mcloud-1.ttl.tar.gz && \
axel https://hobbitdata.informatik.uni-leipzig.de/OPAL/OpalGraph/2020-11-18/2020-10/govdata.tar.gz && \
axel https://hobbitdata.informatik.uni-leipzig.de/OPAL/OpalGraph/2020-11-18/2020-10/edp.tar.gz && \
tar -xzf mdm-1.ttl.tar.gz -C ./ && \
tar -xzf mcloud-1.ttl.tar.gz -C ./ && \
tar -xzf govdata.tar.gz -C ./ && \
tar -xzf edp.tar.gz -C ./ 
RUN \
mkdir /tmp/opal-2020-06 && \
cd /tmp/opal-2020-06 && \
axel https://hobbitdata.informatik.uni-leipzig.de/OPAL/OpalGraph/2020-10-22/2020-06/mdm-1.ttl.tar.gz && \
axel https://hobbitdata.informatik.uni-leipzig.de/OPAL/OpalGraph/2020-10-22/2020-06/mcloud-1.ttl.tar.gz && \
axel https://hobbitdata.informatik.uni-leipzig.de/OPAL/OpalGraph/2020-10-22/2020-06/govdata.tar.gz && \
axel https://hobbitdata.informatik.uni-leipzig.de/OPAL/OpalGraph/2020-10-22/2020-06/edp.tar.gz && \
tar -xzf mdm-1.ttl.tar.gz -C ./ && \
tar -xzf mcloud-1.ttl.tar.gz -C ./ && \
tar -xzf govdata.tar.gz -C ./ && \
tar -xzf edp.tar.gz -C ./


# Copy import script

COPY import.sh /jena-fuseki/
RUN chmod 755 /jena-fuseki/import.sh


# Edit config (becomes /fuseki/shiro.ini)

RUN sed -i 's/.*\/$\/\*\*/#&/' /jena-fuseki/shiro.ini
