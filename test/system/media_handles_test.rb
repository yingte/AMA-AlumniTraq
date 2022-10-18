# frozen_string_literal: true

require 'application_system_test_case'

class MediaHandlesTest < ApplicationSystemTestCase
  before do
    @media_handle = media_handles(:one)
  end

  test 'visiting the index' do
    visit media_handles_url
    assert_selector 'h1', text: 'Media Handles'
  end

  test 'creating a Media handle' do
    visit media_handles_url
    click_on 'New Media Handle'

    fill_in 'Alumnus', with: @media_handle.alumnus_id
    fill_in 'Link', with: @media_handle.link
    fill_in 'Platform', with: @media_handle.platform
    click_on 'Create Media handle'

    assert_text 'Media handle was successfully created'
    click_on 'Back'
  end

  test 'updating a Media handle' do
    visit media_handles_url
    click_on 'Edit', match: :first

    fill_in 'Alumnus', with: @media_handle.alumnus_id
    fill_in 'Link', with: @media_handle.link
    fill_in 'Platform', with: @media_handle.platform
    click_on 'Update Media handle'

    assert_text 'Media handle was successfully updated'
    click_on 'Back'
  end

  test 'destroying a Media handle' do
    visit media_handles_url
    page.accept_confirm do
      click_on 'Destroy', match: :first
    end

    assert_text 'Media handle was successfully destroyed'
  end
end
