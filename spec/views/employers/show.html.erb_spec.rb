# frozen_string_literal: true

require 'rails_helper'

RSpec.describe('employers/show', type: :view) do
  before do
    @employer = assign(:employer, Employer.create!)
  end

  it 'renders attributes in <p>' do
    render
  end
end
