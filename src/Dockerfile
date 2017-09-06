FROM alpine:edge

# update
RUN apk update

# install bash
RUN apk add bash

# install mongo
RUN apk add mongodb-tools \
    mongodb \
  && rm /usr/bin/mongoperf

# install google cloud sdk
ENV CLOUD_SDK_VERSION 169.0.0
ENV PATH /google-cloud-sdk/bin:$PATH
RUN apk add \
    python \
    curl \
    libc6-compat \
    openssh-client \
    git \
  && curl -O https://dl.google.com/dl/cloudsdk/channels/rapid/downloads/google-cloud-sdk-${CLOUD_SDK_VERSION}-linux-x86_64.tar.gz \
  && tar xzf google-cloud-sdk-${CLOUD_SDK_VERSION}-linux-x86_64.tar.gz \
  && rm google-cloud-sdk-${CLOUD_SDK_VERSION}-linux-x86_64.tar.gz \
  && ln -s /lib /lib64 \
  && gcloud config set core/disable_usage_reporting true \
  && gcloud config set component_manager/disable_update_check true \
  && gcloud config set metrics/environment github_docker_image

# export data from mongo
CMD mongoexport \
    --host ${MONGO_HOST} \
    --username ${MONGO_USERNAME} \
    --password ${MONGO_PASSWORD} \
    --db ${MONGO_DATABASE} \
    --collection ${MONGO_COLLECTION} \
    --type json \
    --out ${FILENAME}

# add entrypoint script
ADD ./entrypoint.sh ./
RUN chmod +x ./entrypoint.sh

CMD ./entrypoint.sh ${FILENAME} ${GS_LOCATION} ${DESTINATION_TABLE} ${GS_SCHEMA_FILE}
