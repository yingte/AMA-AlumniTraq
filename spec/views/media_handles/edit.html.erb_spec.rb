require 'rails_helper'

RSpec.describe "media_handles/edit", type: :view do
  alumnus_user = get_alumnus_user()
  alumnus_info = get_alumnus_info(alumnus_user)

  let(:media_handle) {
    MediaHandle.create!(
      alumnus: alumnus_info,
      platform: "MyString",
      link: "MyString"
    )
  }

  before(:each) do
    assign(:media_handle, media_handle)
  end

  it "renders the edit media_handle form" do
    render

    assert_select "form[action=?][method=?]", media_handle_path(media_handle), "post" do

      assert_select "select[name=?]", "media_handle[alumnus_id]"

      assert_select "select[name=?]", "media_handle[platform]"

      assert_select "input[name=?]", "media_handle[link]"
    end
  end
end
