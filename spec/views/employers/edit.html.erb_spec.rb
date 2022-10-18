# frozen_string_literal: true

require 'rails_helper'

RSpec.describe('employers/edit', type: :view) do
  before do
    @employer = assign(:employer, Employer.create!)
  end

  it 'renders the edit employer form' do
    render

    # rubocop:todo Style/InlineComment
    assert_select 'form[action=?][method=?]', employer_path(@employer), 'post' do # rubocop:todo Lint/EmptyBlock, Style/InlineComment
      # rubocop:enable Style/InlineComment
    end
  end
end
