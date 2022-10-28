# frozen_string_literal: true

require 'test_helper'

class AlumniControllerTest < ActionDispatch::IntegrationTest
  # before do
  #   @alumnus = alumni(:one)
  # end

  test 'should get index' do
    get alumni_url
    assert_response :success
  end

  test 'should get new' do
    get new_alumnus_url
    assert_response :success
  end

  test 'should create alumnus' do
    @alumnus = alumni(:one)
    assert_difference('Alumnus.count') do
      post alumni_url,
           params: {
             alumnus: {
               availability: @alumnus.availability,
               bio: @alumnus.bio,
               employer: @alumnus.employer,
               job_title: @alumnus.job_title,
               user_id: @alumnus.user_id
             }
           }
    end

    assert_redirected_to alumnus_url(Alumnus.last)
  end

  test 'should show alumnus' do
    @alumnus = alumni(:one)
    get alumnus_url(@alumnus)
    assert_response :success
  end

  test 'should get edit' do
    @alumnus = alumni(:one)
    get edit_alumnus_url(@alumnus)
    assert_response :success
  end

  test 'should update alumnus' do
    @alumnus = alumni(:one)
    patch alumnus_url(@alumnus),
          params: {
            alumnus: {
              availability: @alumnus.availability,
              bio: @alumnus.bio,
              employer: @alumnus.employer,
              job_title: @alumnus.job_title,
              user_id: @alumnus.user_id
            }
          }
    assert_redirected_to alumnus_url(@alumnus)
  end

  test 'should destroy alumnus' do
    @alumnus = alumni(:one)
    assert_difference('Alumnus.count', -1) do
      delete alumnus_url(@alumnus)
    end

    assert_redirected_to alumni_url
  end
end
