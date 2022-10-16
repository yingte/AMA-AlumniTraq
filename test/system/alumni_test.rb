require "application_system_test_case"

class AlumniTest < ApplicationSystemTestCase
  setup do
    @alumnus = alumni(:one)
  end

  test "visiting the index" do
    visit alumni_url
    assert_selector "h1", text: "Alumni"
  end

  test "creating a Alumnus" do
    visit alumni_url
    click_on "New Alumnus"

    fill_in "Availability", with: @alumnus.availability
    fill_in "Bio", with: @alumnus.bio
    fill_in "Employer", with: @alumnus.employer
    fill_in "Job title", with: @alumnus.job_title
    fill_in "User", with: @alumnus.user_id
    click_on "Create Alumnus"

    assert_text "Alumnus was successfully created"
    click_on "Back"
  end

  test "updating a Alumnus" do
    visit alumni_url
    click_on "Edit", match: :first

    fill_in "Availability", with: @alumnus.availability
    fill_in "Bio", with: @alumnus.bio
    fill_in "Employer", with: @alumnus.employer
    fill_in "Job title", with: @alumnus.job_title
    fill_in "User", with: @alumnus.user_id
    click_on "Update Alumnus"

    assert_text "Alumnus was successfully updated"
    click_on "Back"
  end

  test "destroying a Alumnus" do
    visit alumni_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Alumnus was successfully destroyed"
  end
end
