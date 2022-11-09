# frozen_string_literal: true

class SessionsController < ApplicationController
  # Must skip the redirect to login or else we enter infinite loop
  skip_before_action :set_current_user

  def new; end

  def destroy
    # Remove user from session
    if Rails.env.test?
      ENV['user_id'] = nil
    else
      session[:user_id] = nil
    end

    # Redirect to login page
    redirect_to(login_path, notice: 'Logged out')
  end
end
