# frozen_string_literal: true

require 'rails_helper'

RSpec.describe('majors/new', type: :view) do
  before do
    assign(:major, Major.new(
                     name: 'MyString'
                   )
    )
  end

  it 'renders new major form' do
    render

    assert_select 'form[action=?][method=?]', majors_path, 'post' do
      assert_select 'input[name=?]', 'major[name]'
    end
  end
end
