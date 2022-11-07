# frozen_string_literal: true

require 'rails_helper'

RSpec.describe('majors/index', type: :view) do
  before do
    assign(:majors, [
      Major.find_or_create_by!(
        name: 'Name'
      ),
      Major.find_or_create_by!(
        name: 'Name'
      )
    ]
    )
  end

  it 'renders a list of majors' do
    render
    cell_selector = Rails::VERSION::STRING >= '7' ? 'div>p' : 'tr>td'
    assert_select cell_selector, text: Regexp.new('Name'.to_s), count: 2
  end
end
