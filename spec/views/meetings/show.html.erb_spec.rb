# frozen_string_literal: true

require 'rails_helper'

RSpec.describe('meetings/show', type: :view) do
  before do
    assign(:meeting, Meeting.find_or_create_by!(
                       name: 'Name',
                       description: 'MyText'
                     )
    )
  end

  it 'renders attributes in <p>' do
    render
    expect(rendered).to(match(/Name/))
    expect(rendered).to(match(/MyText/))
  end
end
