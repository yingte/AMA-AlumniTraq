require 'rails_helper'

RSpec.describe "job_categories/index", type: :view do
  before(:each) do
    assign(:job_categories, [
      JobCategory.create!(
        name: "Name"
      ),
      JobCategory.create!(
        name: "Name"
      )
    ])
  end

  it "renders a list of job_categories" do
    render
    assert_select "tr>td", text: "Name".to_s, count: 2
  end
end
