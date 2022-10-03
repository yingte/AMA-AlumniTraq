require 'rails_helper'

RSpec.describe "majors/index", type: :view do
  before(:each) do
    assign(:majors, [
      Major.create!(
        name: "Name"
      ),
      Major.create!(
        name: "Name"
      )
    ])
  end

  it "renders a list of majors" do
    render
    assert_select "tr>td", text: "Name".to_s, count: 2
  end
end
