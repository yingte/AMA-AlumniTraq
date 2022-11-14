# frozen_string_literal: true

require 'rails_helper'

RSpec.describe('alumni/show', type: :view) do
  alumnus_user = User.find_or_create_by!(
    email: 'thegoodag@gmail.com',
    role_id: 3,
    first_name: 'Ole',
    last_name: 'Rock',
    major_id: 65,
    graduation_year: 1954,
    phone: '',
    is_approved: false
  )

  before do
    assign(:alumnus, Alumnus.find_or_create_by!(
                       user: alumnus_user,
                       bio: 'MyText',
                       job_title: 'Job Title',
                       job_category: nil,
                       employer: 'Employer',
                       availability: 'MyText'
                     )
    )
  end

  it 'renders attributes in <p>' do
    render
    expect(rendered).to(match(//))
    expect(rendered).to(match(/MyText/))
    expect(rendered).to(match(/Job Title/))
    expect(rendered).to(match(//))
    expect(rendered).to(match(/Employer/))
    expect(rendered).to(match(/MyText/))
  end
end
