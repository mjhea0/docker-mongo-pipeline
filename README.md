# Docker Mongo Pipeline

Pipeline:

1. Export `users` collection from MongoDB as JSON
1. gzip the JSON file
1. Upload JSON data to Google Cloud Storage
1. Convert JSON to a BigQuery table

## Setup

1. Fork/Clone this repo

1. Download [Docker](https://docs.docker.com/docker-for-mac/install/) (if necessary)

1. Make sure you are using a Docker version >= 17:

    ```sh
    $ docker -v
    Docker version 17.03.0-ce, build 60ccb22
    ```

## Workflow

Create and update the *.env* file:

```sh
$ cp .env.sample .env
```

Build and tag the image:

```sh
$ docker build -t sample ./src
```

Run the container:

```sh
$ docker run --env-file .env -it sample
```
