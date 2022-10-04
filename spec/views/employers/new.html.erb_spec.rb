require 'rails_helper'

RSpec.describe "employers/new", type: :view do
  before(:each) do
    assign(:employer, Employer.new())
  end

  it "renders new employer form" do
    render

    assert_select "form[action=?][method=?]", employers_path, "post" do
    end
  end
end
