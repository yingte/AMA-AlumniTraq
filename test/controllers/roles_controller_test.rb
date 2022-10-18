# frozen_string_literal: true

require 'test_helper'

class RolesControllerTest < ActionDispatch::IntegrationTest
  # before do
  #   @role = roles(:one)
  # end

  test 'should get index' do
    get roles_url
    assert_response :success
  end

  test 'should get new' do
    get new_role_url
    assert_response :success
  end

  test 'should create role' do
    @role = roles(:one)
    assert_difference('Role.count') do
      post roles_url, params: { role: { name: @role.name } }
    end

    assert_redirected_to role_url(Role.last)
  end

  test 'should show role' do
    @role = roles(:one)
    get role_url(@role)
    assert_response :success
  end

  test 'should get edit' do
    @role = roles(:one)
    get edit_role_url(@role)
    assert_response :success
  end

  test 'should update role' do
    @role = roles(:one)
    patch role_url(@role), params: { role: { name: @role.name } }
    assert_redirected_to role_url(@role)
  end

  test 'should destroy role' do
    @role = roles(:one)
    assert_difference('Role.count', -1) do
      delete role_url(@role)
    end

    assert_redirected_to roles_url
  end
end
