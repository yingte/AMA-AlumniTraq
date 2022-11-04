require 'rails_helper'

RSpec.describe "job_categories/new", type: :view do
  before(:each) do
    assign(:job_category, JobCategory.new(
      name: "MyString"
    ))
  end

  it "renders new job_category form" do
    render

    assert_select "form[action=?][method=?]", job_categories_path, "post" do

      assert_select "input[name=?]", "job_category[name]"
    end
  end
end
