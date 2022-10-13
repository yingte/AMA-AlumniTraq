class DirectoryController < ApplicationController
    def index
    end

    def search
        # Get all Alumni
        alumni_role = Role.where(name: "Alumni").first
        @users = User.where(role: alumni_role).order(:last_name)
    end

    def show
        @user = User.find(params[:id])
    end
end
