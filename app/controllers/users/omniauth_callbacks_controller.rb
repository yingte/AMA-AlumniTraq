# app/controllers/users/omniauth_callbacks_controller.rb:

class Users::OmniauthCallbacksController < Devise::OmniauthCallbacksController
    def google_oauth2
        render inline: "In google action"
        # puts("Handling authentication from callback...")
        # handle_auth 'Google'
    end

    def facebook
        puts("Handling authentication from callback...")
        handle_auth 'Facebook'
    end

    def linkedin
        puts("Handling authentication from callback...")
        handle_auth 'LinkedIn'
    end

    def handle_auth(provider)
        puts("Handling authentication from callback...")
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