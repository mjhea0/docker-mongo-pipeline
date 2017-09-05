# Docker Mongo Pipeline

Pipeline:

1. Export `users` collection from MongoDB as JSON (WIP)
1. gzip the JSON file (WIP)
1. Upload JSON data to Google Cloud Storage (WIP)
1. Convert JSON to a BigQuery table (WIP)

## Setup

1. Fork/Clone this repo

1. Download [Docker](https://docs.docker.com/docker-for-mac/install/) (if necessary)

1. Make sure you are using a Docker version >= 17:

    ```sh
    $ docker -v
    Docker version 17.03.0-ce, build 60ccb22
    ```

## Workflow

Build the images:

```sh
$ docker-compose build
```

Spin up the containers:

```sh
$ docker-compose up -d
```

This fires up an instance of Mongo running inside of a container and adds the initial seed data - [seed/init.json](seed/init.json). You can view the logs to ensure the data was inserted correctly:

```sh
$ docker-compose logs

Attaching to dockermongopipeline_mongo-seed_1, mongodb
mongo-seed_1  | 2017-09-05T17:10:28.087+0000	connected to: mongo
mongo-seed_1  | 2017-09-05T17:10:28.115+0000	imported 2 documents
```

You can access Mongo on the host computer on port 27017:

```sh
$ mongo --port 27017

> use something
switched to db something
> db.users.find()
{ "_id" : ObjectId("59aeda84592bf63961385eb2"), "address" : { "building" : "469", "coord" : [ -73.961704, 40.662942 ], "street" : "Flatbush Avenue", "zipcode" : "11225" }, "borough" : "Brooklyn", "cuisine" : "Hamburgers", "grades" : [ { "date" : ISODate("2014-12-30T00:00:00Z"), "grade" : "A", "score" : 8 }, { "date" : ISODate("2014-07-01T00:00:00Z"), "grade" : "B", "score" : 23 }, { "date" : ISODate("2013-04-30T00:00:00Z"), "grade" : "A", "score" : 12 }, { "date" : ISODate("2012-05-08T00:00:00Z"), "grade" : "A", "score" : 12 } ], "name" : "Wendy'S", "restaurant_id" : "30112340" }
{ "_id" : ObjectId("59aeda84592bf63961385eb3"), "address" : { "building" : "1007", "coord" : [ -73.856077, 40.848447 ], "street" : "Morris Park Ave", "zipcode" : "10462" }, "borough" : "Bronx", "cuisine" : "Bakery", "grades" : [ { "date" : ISODate("2014-03-03T00:00:00Z"), "grade" : "A", "score" : 2 }, { "date" : ISODate("2013-09-11T00:00:00Z"), "grade" : "A", "score" : 6 }, { "date" : ISODate("2013-01-24T00:00:00Z"), "grade" : "A", "score" : 10 }, { "date" : ISODate("2011-11-23T00:00:00Z"), "grade" : "A", "score" : 9 }, { "date" : ISODate("2011-03-10T00:00:00Z"), "grade" : "B", "score" : 14 } ], "name" : "Morris Park Bake Shop", "restaurant_id" : "30075445" }
> exit
bye
```

Need to update the database and/or collection names? Update the environment variables within the *docker-compose.yml* file.
