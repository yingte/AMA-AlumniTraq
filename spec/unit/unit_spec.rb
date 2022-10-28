# frozen_string_literal: true

require 'rails_helper'

RSpec.describe(User, type: :model) do
  subject do
    described_class.new(first_name: 'Robin', last_name: 'Williams', major: 'Computer Science', graduation_year: 2023,
                        email: 'robinwilliams@gmail.com', phone: '123-456-7890'
    )
  end

  it 'is valid with all valid attributes' do
    expect(subject).to(be_valid)
  end

  it 'is not valid without a price' do
    subject.first_name = nil
    expect(subject).not_to(be_valid)
  end

  it 'is not valid without a published_date' do
    subject.last_name = nil
    expect(subject).not_to(be_valid)
  end

  it 'is not valid without a author' do
    subject.major = nil
    expect(subject).not_to(be_valid)
  end

  it 'is not valid without a price' do
    subject.graduation_year = nil
    expect(subject).not_to(be_valid)
  end

  it 'is not valid without a published_date' do
    subject.email = nil
    expect(subject).not_to(be_valid)
  end

  it 'is not valid without a title' do
    subject.phone = nil
    expect(subject).not_to(be_valid)
  end
end
