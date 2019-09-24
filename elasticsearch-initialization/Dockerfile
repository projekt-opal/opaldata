# OPAL data Elasticsearch initialization
# 
# Repository:
# https://github.com/projekt-opal/opaldata

FROM bitnami/minideb

# Install packages
RUN apt-get update && \
apt-get install -y curl

# Copy data
COPY ./run.sh /
RUN chmod +x /run.sh
COPY mappings.json /

ENTRYPOINT ["sh", "/run.sh"]
