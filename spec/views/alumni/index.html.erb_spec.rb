require 'rails_helper'

RSpec.describe "alumni/index", type: :view do
  alumnus_user1 = User.find_or_create_by!(
    email: 'thegoodag@gmail.com',
    password_digest: '$2a$12$bHVvOOz25bjanV1WWayG6uhDd/qc61qMxtha6gV6h17MfiOmOxQGy',
    role_id: 3,
    first_name: 'Ole',
    last_name: 'Rock',
    major_id: 65,
    graduation_year: 1954,
    phone: '',
    is_approved: false
  )
  alumnus_user2 = User.find_or_create_by!(
    email: 'byron.henderson@gmail.com',
    password_digest: '$2a$12$bHVvOOz25bjanV1WWayG6uhDd/qc61qMxtha6gV6h17MfiOmOxQGy',
    role_id: 3,
    first_name: 'Byron',
    last_name: 'Henderson',
    major_id: 10,
    graduation_year: 2003,
    phone: '',
    is_approved: false
  )

  Alumnus.create!(
    user: alumnus_user1,
    bio: "MyBio",
    job_title: "Job Title",
    job_category_id: 1,
    employer: "Employer",
    availability: "MyText"
  )
  Alumnus.create!(
    user: alumnus_user2,
    bio: "MyBio",
    job_title: "Job Title",
    job_category_id: 1,
    employer: "Employer",
    availability: "MyText"
  )

  before(:each) do
    assign(:users, [alumnus_user1, alumnus_user2])
  end

  it "renders a list of alumni" do
    @users = User.alumni_users.order(:last_name)
    render
    cell_selector = Rails::VERSION::STRING >= '7' ? 'div>p' : 'tr>td'
    assert_select cell_selector, text: Regexp.new("Ole Rock".to_s), count: 1
    assert_select cell_selector, text: Regexp.new("Byron Henderson".to_s), count: 1
    assert_select cell_selector, text: Regexp.new("MyBio".to_s), count: 2
    assert_select cell_selector, text: Regexp.new("Job Title".to_s), count: 2
    assert_select cell_selector, text: Regexp.new("Employer".to_s), count: 2
    assert_select cell_selector, text: Regexp.new("MyText".to_s), count: 2
  end
end
