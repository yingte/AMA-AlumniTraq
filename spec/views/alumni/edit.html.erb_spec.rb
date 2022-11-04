require 'rails_helper'

RSpec.describe "alumni/edit", type: :view do
  alumnus_user = get_alumnus_user()
  admin_user = get_admin_user()

  let(:alumnus) {
    Alumnus.create!(
      user: alumnus_user,
      bio: "MyText",
      job_title: "MyString",
      job_category_id: 1,
      employer: "MyString",
      availability: "MyText"
    )
  }

  before(:each) do
    assign(:alumnus, alumnus)
  end

  it "renders the edit alumnus form" do
    Current.user = admin_user
    Current.previous_path = alumnus_url(alumnus)
    render

    assert_select "form[action=?][method=?]", alumnus_path(alumnus), "post" do

      assert_select "select[name=?]", "alumnus[user_id]"

      assert_select "textarea[name=?]", "alumnus[bio]"

      assert_select "input[name=?]", "alumnus[job_title]"

      assert_select "select[name=?]", "alumnus[job_category_id]"

      assert_select "input[name=?]", "alumnus[employer]"

      assert_select "textarea[name=?]", "alumnus[availability]"
    end
  end
end
