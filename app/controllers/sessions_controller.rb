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
      if user.is_approved
        session[:user_id] = user.id
        redirect_to(root_path, notice: 'Logged in successfully')
      else
        flash[:alert] = 'Waiting Approval from Admin'
        @email = params[:email]
        render(:new)
      end
    else
      flash[:alert] = 'Invalid email or password'
      @email = params[:email]
      render(:new)
    end
  end

  def destroy
    # Remove user from session
    session[:user_id] = nil

    # Redirect to login page
    redirect_to(login_path, notice: 'Logged out')
  end
end
