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
  {role_id: 10, first_name: "Jack", last_name: "Couture", major: "Computer Engineering", graduation_year: 2024, email: "jncouture@tamu.edu", phone: ""}
])
