#!/bin/sh

echo "Setup enviroment"
bundle

echo "Preparing database"
rake db:migrate
rake db:test:prepare

echo "Starting server"
rails server
