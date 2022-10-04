require 'rails_helper'

RSpec.describe "employers/show", type: :view do
  before(:each) do
    @employer = assign(:employer, Employer.create!())
  end

  it "renders attributes in <p>" do
    render
  end
end
