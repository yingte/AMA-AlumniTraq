# frozen_string_literal: true

class SessionsController < ApplicationController
  # Must skip the redirect to login or else we enter infinite loop
  skip_before_action :set_current_user

  def new; end

  def create
    # Search for user with email in database
    user = User.find_by(email: params[:email])

    if user.present? && user.authenticate(params[:password])
      # If email exists and the password digest matches
      if Rails.env.test?
        ENV['user_id'] = String(user.id)
      else
        session[:user_id] = user.id
      end

      redirect_to(root_path, notice: 'Logged in successfully')
    else
      flash[:alert] = 'Invalid email or password'
      @email = params[:email]
      render(:new)
    end
  end

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
