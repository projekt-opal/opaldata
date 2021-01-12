#!/bin/bash

mv /tmp/opal-2020-10 /staging
./load.sh opal-2020-10 *.ttl
rm -rf /staging

mv /tmp/opal-2020-06 /staging
./load.sh opal-2020-06 *.ttl
rm -rf /staging
