# README

## Introduction ##

The Alumni Tracker is a web application for the Aggies Men's Alliance that contains the information of an alumni. The key feature of the application is the directory which is where the alumni information is stored. In the directory, a user may perform a basic or advanced search to find specific alumni. The application also features a calendar where users are able to see AMA events. Users that have the role of administrator are granted access to more features in the app. Administrators are able to create, update, and delete alumni information from the directory. Admins are also able to create, edit, and delete events from the calendar.

## Requirements ##

This code has been run and tested on:

* Ruby - 3.0.2p107
* Rails - 6.1.4.1
* Ruby Gems - Listed in `Gemfile`
* PostgreSQL - 13.3

## External Deps ##

* Docker - Download latest version at <https://www.docker.com/products/docker-desktop>
* Heroku CLI - Download latest version at <https://devcenter.heroku.com/articles/heroku-cli>
* Git - Downloat latest version at <https://git-scm.com/book/en/v2/Getting-Started-Installing-Git>

## Installation ##

Download this code repository by using git:

 `git clone https://github.com/lgloera2023/AMA-AlumniTraq/tree/main`

## Tests ##

An RSpec test suite is available and can be ran using:

  `rspec spec/`

## Execute Code ##

Run the following code in Powershell if using windows or the terminal using Linux/Mac

  `cd AMA-AlumniTraq`

  `docker run --rm -it --volume "$(pwd):/rails_app" -e DATABASE_USER=test_app -e DATABASE_PASSWORD=test_password -p 3000:3000 dmartinez05/ruby_rails_postgresql:latest`

  or for Windows...
  `docker run --rm -it --volume "${PWD}:/csce431" -e DATABASE_USER=test_app -e DATABASE_PASSWORD=test_password -p 3000:3000 dmartinez05/ruby_rails_postgresql:latest`

  `cd rails_app`

Install the app

  `bundle install && rails webpacker:install && rails db:create && db:migrate`

Run the app
  `rails server --binding=0.0.0.0`

The application can be seen using a browser and navigating to <http://localhost:3000/>

## Environmental Variables/Files ##

No environmental variables or files were used

## Deployment ##

Create a Heroku remotes

    `heroku git:remote -a alumnitraq`

Deploy the code

    `git push heroku main`

## CI/CD ##

TBD

## Support ##

Admins looking for support should first look at the application help page.
Users looking for help seek out assistance from the customer.
