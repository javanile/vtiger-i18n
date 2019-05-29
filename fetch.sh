#!/bin/bash

docker-compose up -d
docker cp $(docker-compose ps -q vtiger):/var/www/html/vtiger/languages ./

