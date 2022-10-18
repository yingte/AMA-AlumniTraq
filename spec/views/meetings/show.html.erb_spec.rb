# frozen_string_literal: true

require 'rails_helper'

RSpec.describe('meetings/show', type: :view) do
  before do
    @meeting = assign(:meeting, Meeting.create!(
                                  name: 'Name'
                                )
    )
  end

  it 'renders attributes in <p>' do
    render
    expect(rendered).to(match(/Name/))
  end
end
