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
  {email: "johnny.appleseed@example.com", password_digest: "$2a$12$XR7E3TGsEllzW3xF.5RBsujmLSNjtmoOl7kvwPSalAY6hrZxlItam", role_id: 2, first_name: "Johnny", last_name: "Appleseed", major: "Ag Business", graduation_year: 1950, phone: "8328675309"},
  {email: "thegoodag@gmail.com", password_digest: "$2a$12$TcjwUddJZ.8Q16BMHG5U/OVNKj2X1ipOlMatwW49keoGi5M/VCFIi", role_id: 1, first_name: "Old", last_name: "Rock", major: "Military Science", graduation_year: 1876, phone: "9366392248"},
  {email: "alum2@yahoo.com", password_digest: "$2a$12$zFuF5P7aMCi6o6sFKR0zO.u0FA4KkbTZDPUhrh5g5B0qZK2IjsY.S", role_id: 1, first_name: "Bob", last_name: "Belcher", major: "Nutrition", graduation_year: 1990, phone: "2818675309"},
  {email: "alum3@me.com", password_digest: "$2a$12$oVhPTUgCww2oAqR1qqKyOO3SbRtrlj4YqZIolxboVaPuhxUuXeY9S", role_id: 1, first_name: "Speedy", last_name: "Gonzales", major: "Sports Management", graduation_year: 2000, phone: "8328675309"}
])
Alumnus.create!([
  {user_id: 2, bio: "Old school. General USMC Ret.", job_title: "Retired", employer: "None", availability: "On weekends and holidays."},
  {user_id: 3, bio: "I flip burgers.", job_title: "Restaurant Owner", employer: "Self-Employed", availability: "Never."},
  {user_id: 4, bio: "I run fast.", job_title: "Cartoon Character", employer: "Warner Bros", availability: "Every second."}
])
