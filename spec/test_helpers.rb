# This is to help with functionalities used across multiple files

#-----------------------------------------------#
#                     User                      #
def get_admin_user()
  user = User.find_by(role_id: 1)

  unless user
    user = User.create!(email: 'admin@test.com', password: 'password', password_confirmation: 'password', role_id: 1, first_name: 'Test', last_name: 'Admin', major_id: 1, graduation_year: 2023, phone: "8328675309", is_approved: true)
  end

  user
end

def get_event_planner_user()
  user = User.find_by(role_id: 4)

  unless user
    user = User.create!(email: 'event.planner@test.com', password: 'password', password_confirmation: 'password', role_id: 4, first_name: 'Test', last_name: 'Event Planner', major_id: 1, graduation_year: 2023, phone: "8328675309", is_approved: true)
  end

  user
end

def get_member_user()
  user = User.find_by(role_id: 2)

  unless user
    user = User.create!(email: 'member@test.com', password: 'password', password_confirmation: 'password', role_id: 2, first_name: 'Test', last_name: 'Member', major_id: 1, graduation_year: 2023, phone: "8328675309", is_approved: true)
  end

  user
end

def get_alumnus_user()
  user = User.find_by(role_id: 3)

  unless user
    user = User.create!(email: 'alumnus@test.com', password: 'password', password_confirmation: 'password', role_id: 3, first_name: 'Test', last_name: 'Alumnus', major_id: 1, graduation_year: 1991, phone: "8328675309", is_approved: true)
  end

  user
end

def login_user(user)
  ENV['user_id'] = String(user.id)
end

#-----------------------------------------------#
#                     Other                     #
def get_meeting()
  meeting = Meeting.first_or_create!(name: "Test Meeting", start_time: "Thu, 03 Nov 2022 23:40:00.000000000 CDT -05:00", end_time: "Thu, 03 Nov 2022 23:59:00.000000000 CDT -05:00", description: "Test description")
end

def get_alumnus_info(alumnus)
  info = Alumnus.find_by(id: alumnus.id)
end