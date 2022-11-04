# frozen_string_literal: true

require 'rails_helper'

RSpec.describe('meetings/new', type: :view) do
  before do
    assign(:meeting, Meeting.new(
                       name: 'MyString',
                       description: 'MyText'
                     )
    )
  end

  it 'renders new meeting form' do
    render

    assert_select 'form[action=?][method=?]', meetings_path, 'post' do
      assert_select 'input[name=?]', 'meeting[name]'

      assert_select 'select', count: 10

      assert_select 'input[name=?]', 'meeting[description]'
    end
  end
end
