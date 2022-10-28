# frozen_string_literal: true

require 'test_helper'

class MediaHandlesControllerTest < ActionDispatch::IntegrationTest
  # before do
  #   @media_handle = media_handles(:one)
  # end

  test 'should get index' do
    get media_handles_url
    assert_response :success
  end

  test 'should get new' do
    get new_media_handle_url
    assert_response :success
  end

  test 'should create media_handle' do
    @media_handle = media_handles(:one)
    assert_difference('MediaHandle.count') do
      post media_handles_url,
           params: {
             media_handle: {
               alumnus_id: @media_handle.alumnus_id,
               link: @media_handle.link,
               platform: @media_handle.platform
             }
           }
    end

    assert_redirected_to media_handle_url(MediaHandle.last)
  end

  test 'should show media_handle' do
    @media_handle = media_handles(:one)
    get media_handle_url(@media_handle)
    assert_response :success
  end

  test 'should get edit' do
    @media_handle = media_handles(:one)
    get edit_media_handle_url(@media_handle)
    assert_response :success
  end

  test 'should update media_handle' do
    @media_handle = media_handles(:one)
    patch media_handle_url(@media_handle),
          params: {
            media_handle: {
              alumnus_id: @media_handle.alumnus_id,
              link: @media_handle.link,
              platform: @media_handle.platform
            }
          }
    assert_redirected_to media_handle_url(@media_handle)
  end

  test 'should destroy media_handle' do
    @media_handle = media_handles(:one)
    assert_difference('MediaHandle.count', -1) do
      delete media_handle_url(@media_handle)
    end

    assert_redirected_to media_handles_url
  end
end
