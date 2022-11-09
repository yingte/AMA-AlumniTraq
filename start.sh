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

echo "Migrating development database..."
rails db:migrate

echo "Migrating test database..."
rails db:migrate RAILS_ENV=test

echo "Populating development database with seed..."
rails db:seed

echo "Populating test database with seed..."
rails db:seed RAILS_ENV=test

echo "Launching server..."
echo "rails server --binding=0.0.0.0"
rails server --binding=0.0.0.0

#END