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
FROM stain/jena-fuseki:3.14.0

# Install packages
RUN \
apt-get update -y && \
apt-get install -y wget axel && \
apt-get install -y --no-install-recommends procps

# Download data
RUN \
axel --output=/tmp/opal-2020-04.tar.gz https://hobbitdata.informatik.uni-leipzig.de/OPAL/OpalGraph/latest/2020-04/opal-2020-04.tar.gz && \
axel --output=/tmp/opal-2020-07.tar.gz https://hobbitdata.informatik.uni-leipzig.de/OPAL/OpalGraph/latest/2020-07/opal-2020-07.tar.gz




# TODO
# State: Runs but data is not available. TDB files are not changed.
# Docker has to run to create databases. But for data insertion by tdbloader, it has to be stopped.
# Maybe try assembler https://github.com/projekt-opal/opaldata/wiki/Fuseki

# Extract
#RUN \
#mkdir /tmp/opal-2020-04 && \
#tar -xzf /tmp/opal-2020-04.tar.gz -C /tmp/opal-2020-04/ && \
#rm /tmp/opal-2020-04.tar.gz && \
#mkdir /tmp/opal-2020-07 && \
#tar -xzf /tmp/opal-2020-07.tar.gz -C /tmp/opal-2020-07/ && \
#rm /tmp/opal-2020-07.tar.gz

# Create empty database files
#ADD tdb.tar.gz /fuseki/databases/opal-2020-04
#ADD tdb.tar.gz /fuseki/databases/opal-2020-07

# Import data
#RUN \
#./tdbloader --loc=/fuseki/databases/opal-2020-04 /tmp/opal-2020-04/* && \
#./tdbloader --loc=/fuseki/databases/opal-2020-07 /tmp/opal-2020-07/* &&\
#rm -r /tmp/opal-2020-04/ &&\
#rm -r /tmp/opal-2020-07/
