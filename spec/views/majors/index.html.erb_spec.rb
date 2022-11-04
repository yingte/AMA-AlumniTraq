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
    cell_selector = Rails::VERSION::STRING >= '7' ? 'div>p' : 'tr>td'
    assert_select cell_selector, text: Regexp.new("Name".to_s), count: 2
  end
end
