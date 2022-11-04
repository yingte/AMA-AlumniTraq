# frozen_string_literal: true

# This is to help with functionalities used across multiple files

#-----------------------------------------------#
#                     User                      #
def get_admin_user
  User.find_or_create_by!(
    email: 'admin@test.com',
    password_digest: '$2a$12$bHVvOOz25bjanV1WWayG6uhDd/qc61qMxtha6gV6h17MfiOmOxQGy',
    role_id: 1, 
    first_name: 'Test',
    last_name: 'Admin',
    major_id: 1,
    graduation_year: 2023,
    phone: '8328675309',
    is_approved: true
  )
end

def get_event_planner_user
  User.find_or_create_by!(
    email: 'event.planner@test.com',
    password_digest: '$2a$12$bHVvOOz25bjanV1WWayG6uhDd/qc61qMxtha6gV6h17MfiOmOxQGy',
    role_id: 4, 
    first_name: 'Test',
    last_name: 'Event Planner',
    major_id: 1,
    graduation_year: 2023,
    phone: '8328675309',
    is_approved: true
  )
end

def get_member_user
  User.find_or_create_by!(
    email: 'member@test.com',
    password_digest: '$2a$12$bHVvOOz25bjanV1WWayG6uhDd/qc61qMxtha6gV6h17MfiOmOxQGy',
    role_id: 2,
    first_name: 'Test',
    last_name: 'User',
    major_id: 1,
    graduation_year: 2023,
    phone: '8328675309',
    is_approved: true
  )
end

def get_alumnus_user
  User.find_or_create_by!(
    email: 'alumnus@test.com',
    password_digest: '$2a$12$bHVvOOz25bjanV1WWayG6uhDd/qc61qMxtha6gV6h17MfiOmOxQGy',
    role_id: 3,
    first_name: 'Test',
    last_name: 'Alumnus',
    major_id: 1,
    graduation_year: 1991,
    phone: '8328675309',
    is_approved: true
  )
end

def login_user(user)
  ENV['user_id'] = String(user.id)
end

#-----------------------------------------------#
#                     Other                     #
def get_meeting
  Meeting.find_or_create_by!(
    name: 'Test Meeting',
    start_time: 'Thu, 03 Nov 2022 23:40:00.000000000 CDT -05:00',
    end_time: 'Thu, 03 Nov 2022 23:59:00.000000000 CDT -05:00',
    description: 'Test description'
  )
end

def get_alumnus_info(alumnus)
  Alumnus.find_or_create_by!(
    user_id: alumnus.id,
    bio: 'Test bio',
    job_title: 'Test Job Title',
    job_category_id: 1,
    employer: 'Test Employer',
    availability: 'Test availability'
  )
end

def destroy_if(record)
  if record
    record.destroy!
  end
end