# frozen_string_literal: true

require 'rails_helper'

RSpec.describe('users/show', type: :view) do
  before do
    assign(:user, User.find_or_create_by!(
                    email: 'member@test.com',
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

  it 'renders attributes in <p>' do
    render
    expect(rendered).to(match(/Member/))
    expect(rendered).to(match(/Test/))
    expect(rendered).to(match(/User/))
    expect(rendered).to(match(/International Studies/))
    expect(rendered).to(match(/2023/))
    expect(rendered).to(match(/member@test.com/))
    expect(rendered).to(match(/8328675309/))
  end
end
