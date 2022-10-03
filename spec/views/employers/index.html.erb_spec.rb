require 'rails_helper'

RSpec.describe "employers/index", type: :view do
  before(:each) do
    assign(:employers, [
      Employer.create!(),
      Employer.create!()
    ])
  end

  it "renders a list of employers" do
    render
  end
end
