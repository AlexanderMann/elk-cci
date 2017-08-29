# elk-cci
[![CircleCI](https://circleci.com/gh/AlexanderMann/elk-cci.svg?style=svg)](https://circleci.com/gh/AlexanderMann/elk-cci) 
[Circle Workflow](https://circleci.com/gh/AlexanderMann/workflows/elk-cci)
[Dockerhub](https://hub.docker.com/r/mannimal/elk-cci/)

All the goodies necessary for testing/using ELK and TCP input in Circle CI.

See [here](https://github.com/spujadas/elk-docker) for Spujadas's excellent github repo for this.

This container was built with (the now not so recommended) [TCP input mechanism for Log4J](https://www.elastic.co/guide/en/logstash/current/plugins-inputs-tcp.html) and [Timbre](https://github.com/ptaoussanis/timbre/blob/master/src/taoensso/timbre/appenders/3rd_party/logstash.clj) in mind.

## Suggested Setup in docker-compose:

```
  elk:
    image: mannimal/elk-cci
    ports:
      - "5601:5601" # Kibana
      - "9200:9200" # Elasticsearch
      - "5044:5044" # Logstash input
```

# NOTE:
If you want to customize things in this container, please please please use the original `sebp/elk` container!!! This conatiner is merely a convenience image and is not intended to be of much customization use.

# Getting Started

If using `docker-compose`, follow the standard workflow of `docker-compose up -d --build` etc.

Once your container is up and running, send a few Log lines to it and follow the instructions below! Host and port using the above would be `elk` and `5044`.

## ElasticSearch

If you want to view the raw data kicking around in ElasticSearch, go [`http://localhost:9200/_search?pretty`](http://localhost:9200/_search?pretty). This can be particularly useful for debugging where in the pipeline your messages are getting to, etc.

## Kibana

Open <http://localhost:5601> to get to the dashboard.

You will be required to have sent some data to Logstash to output in order to use Kibana. As soon as you've gone this, you should be able to click the `Create` button underneath `Configure an index pattern...`.

## Add a Dashboard/Graph
You can now start exploring the values capture by Logstash in Kibana by creating a dashboard, and a graph, or simply going to `Discover`.

<img width="1367" alt="screen shot 2017-08-20 at 11 09 51" src="https://user-images.githubusercontent.com/3885029/29496450-70916b54-8598-11e7-99ba-40b26c681ec3.png">
