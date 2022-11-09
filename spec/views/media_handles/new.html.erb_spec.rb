# frozen_string_literal: true

require 'rails_helper'

RSpec.describe('media_handles/new', type: :view) do
  before do
    alumnus_user = get_alumnus_user
    alumnus_info = get_alumnus_info(alumnus_user)

    assign(:media_handle, MediaHandle.new(
                            alumnus: alumnus_info,
                            platform: 'MyString',
                            link: 'MyString'
                          )
    )
  end

  it 'renders new media_handle form' do
    render

    assert_select 'form[action=?][method=?]', media_handles_path, 'post' do
      assert_select 'select[name=?]', 'media_handle[alumnus_id]'

      assert_select 'select[name=?]', 'media_handle[platform]'

      assert_select 'input[name=?]', 'media_handle[link]'
    end
  end
end
