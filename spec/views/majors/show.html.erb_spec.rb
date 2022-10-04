require 'rails_helper'

RSpec.describe "majors/show", type: :view do
  before(:each) do
    @major = assign(:major, Major.create!(
      name: "Name"
    ))
  end

  it "renders attributes in <p>" do
    render
    expect(rendered).to match(/Name/)
  end
end
