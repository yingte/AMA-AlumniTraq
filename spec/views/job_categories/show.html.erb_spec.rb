require 'rails_helper'

RSpec.describe "job_categories/show", type: :view do
  before(:each) do
    @job_category = assign(:job_category, JobCategory.create!(
      name: "Name"
    ))
  end

  it "renders attributes in <p>" do
    render
    expect(rendered).to match(/Name/)
  end
end
