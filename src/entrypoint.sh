#!/bin/bash

FILENAME=$1
GS_LOCATION=$2
DESTINATION_TABLE=$3
GS_SCHEMA_FILE=$4

echo ${FILENAME}
echo ${GS_LOCATION}
echo ${DESTINATION_TABLE}

gzip -k ${FILENAME}.json
echo "gzip complete!"

# gsutil cp ${FILENAME}.json.gz ${GS_LOCATION}
# echo "uploaded file to Google Cloud Storage!"

# bq ${DESTINATION_TABLE} ${GS_LOCATION}${FILENAME}.json.gz/${GS_SCHEMA_FILE}
# echo "converted the file into a BigQuery table!"
