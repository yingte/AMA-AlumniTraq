# frozen_string_literal: true

require 'rails_helper'

RSpec.describe('media_handles/show', type: :view) do
  before do
    alumnus_user = get_alumnus_user
    @alumnus_info = get_alumnus_info(alumnus_user)

    assign(:media_handle, MediaHandle.find_or_create_by!(
                            alumnus: @alumnus_info,
                            platform: 'Platform',
                            link: 'Link'
                          )
    )
  end

  it 'renders attributes in <p>' do
    render
    expect(rendered).to(match(/#{@alumnus_info.user.first_name}/))
    expect(rendered).to(match(/Platform/))
    expect(rendered).to(match(/Link/))
  end
end
