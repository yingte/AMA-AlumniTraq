class ApplicationController < ActionController::Base
    before_action :set_current_user
    before_action :set_smart_link

    def set_current_user
        if session[:user_id]
            Current.user = User.find_by(id: session[:user_id])

            if Current.user == nil
                # Remove user from session
                session[:user_id] = nil

                # Redirect to login page
                redirect_to login_path
            end
        else
            redirect_to login_path
        end
    end

    def check_authority
        if Current.user.role.id != 1
            respond_to do |format|
                format.html { render file: "#{Rails.root}/public/401.html", :layout => false, :status => :unauthorized }
                format.xml  { head :unauthorized }
                format.any  { head :unauthorized }
            end
        end
    end

    def set_smart_link
        Current.previous_path = session[:current_path]
        Current.current_path = request.path
        session[:current_path] = request.path
    end
end
