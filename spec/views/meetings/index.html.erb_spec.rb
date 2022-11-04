require 'rails_helper'

RSpec.describe "meetings/index", type: :view do
  before(:each) do
    assign(:meetings, [
      Meeting.create!(
        name: "Name",
        start_time: "Thu, 03 Nov 2022 23:40:00.000000000 CDT -05:00", 
        end_time: "Thu, 03 Nov 2022 23:59:00.000000000 CDT -05:00", 
        description: "MyText"
      ),
      Meeting.create!(
        name: "Name",
        start_time: "Thu, 04 Nov 2022 23:40:00.000000000 CDT -05:00", 
        end_time: "Thu, 04 Nov 2022 23:59:00.000000000 CDT -05:00", 
        description: "MyText"
      )
    ])
  end

  it "renders a list of meetings" do
    render
    cell_selector = Rails::VERSION::STRING >= '7' ? 'div>p' : 'tr>td>div>a'
    assert_select cell_selector, text: Regexp.new("Name".to_s), count: 2
  end
end
