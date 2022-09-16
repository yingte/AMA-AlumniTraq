# README

This README would normally document whatever steps are necessary to get the
application up and running.

Things you may want to cover:

* Ruby version

* System dependencies

* Configuration

* Database creation

* Database initialization

* How to run the test suite

* Services (job queues, cache servers, search engines, etc.)

* Local Deployment Instructions. Run Docker image by executing:

    1. docker run --rm -it --volume "${PWD}:/csce431" -e DATABASE_USER=test_app -e DATABASE_PASSWORD=test_password -p 3000:3000 dmartinez05/ruby_rails_postgresql:latest 

    2. cd csce431

    3. bundle install

    4. rails db:create

    5. rails db:migrate

    6. rails server --binding=0.0.0.0

    7. http://127.0.0.1:3000