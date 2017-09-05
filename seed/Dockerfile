FROM mongo:latest

# get environment variables
ARG DATABASE_NAME
ARG COLLECTION_NAME
ENV DATABASE_NAME=$DATABASE_NAME
ENV COLLECTION_NAME=$COLLECTION_NAME

COPY init.json /init.json
CMD mongoimport --host mongo --db DATABASE_NAME --collection COLLECTION_NAME --type json --file /init.json --jsonArray
