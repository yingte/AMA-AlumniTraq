require 'rails_helper'

RSpec.describe "job_categories/edit", type: :view do
  let(:job_category) {
    JobCategory.create!(
      name: "MyString"
    )
  }

  before(:each) do
    assign(:job_category, job_category)
  end

  it "renders the edit job_category form" do
    render

    assert_select "form[action=?][method=?]", job_category_path(job_category), "post" do

      assert_select "input[name=?]", "job_category[name]"
    end
  end
end
