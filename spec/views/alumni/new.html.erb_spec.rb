require 'rails_helper'

RSpec.describe "alumni/new", type: :view do
  before(:each) do
    assign(:alumnus, Alumnus.new(
      user: nil,
      bio: "MyText",
      job_title: "MyString",
      job_category: nil,
      employer: "MyString",
      availability: "MyText"
    ))
  end

  it "renders new alumnus form" do
    render

    assert_select "form[action=?][method=?]", alumni_path, "post" do

      assert_select "select[name=?]", "alumnus[user_id]"

      assert_select "textarea[name=?]", "alumnus[bio]"

      assert_select "input[name=?]", "alumnus[job_title]"

      assert_select "select[name=?]", "alumnus[job_category_id]"

      assert_select "input[name=?]", "alumnus[employer]"

      assert_select "textarea[name=?]", "alumnus[availability]"
    end
  end
end
