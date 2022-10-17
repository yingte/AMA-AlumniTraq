require 'rails_helper'

# Example
RSpec.describe 'Creating a User', type: :feature do
  scenario 'valid inputs' do
    visit new_user_path
    fill_in 'First name', with: 'Robin'
    fill_in 'Last name', with: 'Williams'
    fill_in 'Major', with: 'Computer Science'
    fill_in 'Graduation year', with: '2023'
    fill_in 'Email', with: 'robinwilliams@gmail.com'
    fill_in 'Phone', with: '1234567890'
    click_on 'Create User'
    visit users_path
    expect(page).to have_content('Robin')
    expect(page).to have_content('Williams')
    expect(page).to have_content('Computer Science')
    expect(page).to have_content('2023')
    expect(page).to have_content('robinwilliams@gmail.com')
    expect(page).to have_content('123-456-7890')
  end
end
