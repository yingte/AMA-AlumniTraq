# app/controllers/users/omniauth_callbacks_controller.rb:

class Users::OmniauthCallbacksController < Devise::OmniauthCallbacksController
    skip_before_action :set_current_user

    def google_oauth2
        handle_auth 'Google'
    end

    def facebook
        handle_auth 'Facebook'
    end

    def linkedin
        handle_auth 'LinkedIn'
    end

    def handle_auth(provider)
        # Implemented in app/models/user.rb
        @user = User.from_omniauth(request.env['omniauth.auth'])
  
        if @user.persisted?
          session[:user_id] = @user.id
          redirect_to root_path, notice: "Logged in with #{provider}"
        else
          render new_user_path
        end
    end
  end