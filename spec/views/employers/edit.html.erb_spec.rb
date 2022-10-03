require 'rails_helper'

RSpec.describe "employers/edit", type: :view do
  before(:each) do
    @employer = assign(:employer, Employer.create!())
  end

  it "renders the edit employer form" do
    render

    assert_select "form[action=?][method=?]", employer_path(@employer), "post" do
    end
  end
end
