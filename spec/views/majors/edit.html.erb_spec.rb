require 'rails_helper'

RSpec.describe "majors/edit", type: :view do
  before(:each) do
    @major = assign(:major, Major.create!(
      name: "MyString"
    ))
  end

  it "renders the edit major form" do
    render

    assert_select "form[action=?][method=?]", major_path(@major), "post" do

      assert_select "input[name=?]", "major[name]"
    end
  end
end
