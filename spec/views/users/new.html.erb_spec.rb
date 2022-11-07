# frozen_string_literal: true

require 'rails_helper'

RSpec.describe('users/new', type: :view) do
  before do
    assign(:user, User.new(
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
    )
  end

  it 'renders new user form' do
    render

    assert_select 'form[action=?][method=?]', users_path, 'post' do
      assert_select 'input[name=?]', 'user[email]'

      assert_select 'select[name=?]', 'user[role_id]'

      assert_select 'input[name=?]', 'user[first_name]'

      assert_select 'input[name=?]', 'user[last_name]'

      assert_select 'select[name=?]', 'user[major_id]'

      assert_select 'input[name=?]', 'user[graduation_year]'

      assert_select 'input[name=?]', 'user[phone]'
    end
  end
end
