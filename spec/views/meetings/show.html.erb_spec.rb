require 'rails_helper'

RSpec.describe "meetings/show", type: :view do
  before(:each) do
    assign(:meeting, Meeting.create!(
      name: "Name",
      description: "MyText"
    ))
  end

  it "renders attributes in <p>" do
    render
    expect(rendered).to match(/Name/)
    expect(rendered).to match(/MyText/)
  end
end
