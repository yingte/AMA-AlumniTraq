# frozen_string_literal: true

require 'rails_helper'

RSpec.describe('roles/edit', type: :view) do
  let(:role) do
    Role.find_or_create_by!(
      name: 'MyString'
    )
  end

  before do
    assign(:role, role)
  end

  it 'renders the edit role form' do
    render

    assert_select 'form[action=?][method=?]', role_path(role), 'post' do
      assert_select 'input[name=?]', 'role[name]'
    end
  end
end
