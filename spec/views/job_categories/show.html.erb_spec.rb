# frozen_string_literal: true

require 'rails_helper'

RSpec.describe('job_categories/show', type: :view) do
  before do
    assign(:job_category, JobCategory.find_or_create_by!(
                            name: 'Name'
                          )
    )
  end

  it 'renders attributes in <p>' do
    render
    expect(rendered).to(match(/Name/))
  end
end
