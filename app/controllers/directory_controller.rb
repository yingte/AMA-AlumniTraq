class DirectoryController < ApplicationController
    def index
    end

    def search
        # Get all Alumni
        alumni_role = Role.where(name: "Alumni").first
        @alumni = User.where(role: alumni_role).order(:last_name)
        @alumni_info = Alumnus.joins(:user).order('users.last_name')
    end

    def show
        @alumnus = User.find(params[:id])
        @alumnus_info = Alumnus.where('user_id = ' + String(params[:id])).first
    end
end
