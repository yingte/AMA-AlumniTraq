#!/bin/bash
# Date: 20221012
# Author: Luke Loera
# Purpose: Make it easier to fire up Docker container for local Rails application.
# Use:
#   1. Start the docker container
#   2. Execute the following two commands
#     >> cd csce431
#     >> ./LocalStartup.sh

bundle install

echo "Creating database..."
rails db:create

echo "Migrating..."
rails db:migrate

echo "Populating database with seed..."
rails db:seed

echo "Launching server..."
echo "rails server --binding=0.0.0.0"
rails server --binding=0.0.0.0

#END