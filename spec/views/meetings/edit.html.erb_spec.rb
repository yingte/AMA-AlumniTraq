# frozen_string_literal: true

require 'rails_helper'

RSpec.describe('meetings/edit', type: :view) do
  let(:meeting) do
    Meeting.find_or_create_by!(
      name: 'MyString',
      description: 'MyText'
    )
  end

  before do
    assign(:meeting, meeting)
  end

  it 'renders the edit meeting form' do
    render

    assert_select 'form[action=?][method=?]', meeting_path(meeting), 'post' do
      assert_select 'input[name=?]', 'meeting[name]'

      assert_select 'select', count: 10

      assert_select 'input[name=?]', 'meeting[description]'
    end
  end
end
