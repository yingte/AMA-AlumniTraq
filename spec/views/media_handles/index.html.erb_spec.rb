require 'rails_helper'

RSpec.describe "media_handles/index", type: :view do
  alumnus_user = get_alumnus_user()
  alumnus_info = get_alumnus_info(alumnus_user)
  before(:each) do
    assign(:media_handles, [
      MediaHandle.create!(
        alumnus: alumnus_info,
        platform: "Platform",
        link: "Link"
      ),
      MediaHandle.create!(
        alumnus: alumnus_info,
        platform: "Platform",
        link: "Link"
      )
    ])
  end

  it "renders a list of media_handles" do
    render
    cell_selector = Rails::VERSION::STRING >= '7' ? 'div>p' : 'tr>td'
    assert_select cell_selector, text: Regexp.new(alumnus_info.user.first_name.to_s), count: 2
    assert_select cell_selector, text: Regexp.new("Platform".to_s), count: 2
    assert_select cell_selector, text: Regexp.new("Link".to_s), count: 2
  end
end
