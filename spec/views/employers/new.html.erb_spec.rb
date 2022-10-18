# frozen_string_literal: true

require 'rails_helper'

RSpec.describe('employers/new', type: :view) do
  before do
    assign(:employer, Employer.new)
  end

  it 'renders new employer form' do
    render

    # rubocop:todo Style/InlineComment
    assert_select 'form[action=?][method=?]', employers_path, 'post' do # rubocop:todo Lint/EmptyBlock, Style/InlineComment
      # rubocop:enable Style/InlineComment
    end
  end
end
