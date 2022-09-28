# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
Role.create!([
  {name: "Alumni"},
  {name: "Member"},
  {name: "Service"},
  {name: "Treasury"},
  {name: "Public Relations"},
  {name: "Special Events"},
  {name: "Brotherhood"},
  {name: "Social"},
  {name: "Historian"},
  {name: "IT"},
  {name: "Vice President"},
  {name: "President"}
])
User.create!([
  {role_id: 10, first_name: "Jack", last_name: "Couture", major: "Computer Engineering", graduation_year: 2024, email: "jncouture@tamu.edu", phone: ""},
  {role_id: 1, first_name: "Alum", last_name: "One", major: "Computer Science", graduation_year: 2020, email: "alum.one@gmail.com", phone: "1111110000"},
  {role_id: 1, first_name: "Alum", last_name: "Two", major: "Computer Engineering", graduation_year: 2019, email: "alum.two@me.com", phone: "1111110001"},
  {role_id: 1, first_name: "Alum", last_name: "Three", major: "Poultry Science", graduation_year: 2018, email: "alum.three@comcast.net", phone: "1111110002"}
])
Alumnus.create!([
  {user_id: 3, bio: "I am alum two.", job_title: "Embedded Systems Designer", employer: "L3Harris", availability: "By pigeon carrier."},
  {user_id: 2, bio: "I am alum one.", job_title: "Junior Software Developer", employer: "Google", availability: "I'll respond in my DM's occasionally."},
  {user_id: 4, bio: "I am alum three.", job_title: "Butcher Supervisor", employer: "Tyson Meat Co.", availability: "On weekends and holidays."}
])