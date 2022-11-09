# frozen_string_literal: true

require 'rails_helper'

RSpec.describe('majors/edit', type: :view) do
  let(:major) do
    Major.find_or_create_by!(
      name: 'MyString'
    )
  end

  before do
    assign(:major, major)
  end

  it 'renders the edit major form' do
    render

    assert_select 'form[action=?][method=?]', major_path(major), 'post' do
      assert_select 'input[name=?]', 'major[name]'
    end
  end
end
