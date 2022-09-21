# README

Texas A&M CSCE 431 Software Engineering project by team JPLEC, which is aptly named after members Josh, Priscilla, Luke, Emmanuel, and Caroline. This is the minimum viable product.

General Specs:

* ruby-3.0.2

* PSQL

* Docker recommended if running locally on Windows machine.

Things still to cover:

* Database creation

* Database initialization

* How to run the test suite

Local Deployment Instructions. Execute the following in terminal:

1. docker run --rm -it --volume "${PWD}:/csce431" -e DATABASE_USER=test_app -e DATABASE_PASSWORD=test_password -p 3000:3000 dmartinez05/ruby_rails_postgresql:latest 

2. cd csce431

3. bundle install

4. rails db:create

5. rails db:migrate

6. rails db:seed

7. rails server --binding=0.0.0.0

8. Search http://127.0.0.1:3000 in browser.