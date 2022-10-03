class DirectoryController < ApplicationController
    def index
    end

    def search
        if params[:search].present?
            alumni_role = Role.where(name: "Alumni").first
            @alumni = User.where(["first_name LIKE ?", "%#{params[:search]}%"]).order(:last_name)
            @alumni_info = Alumnus.joins(:user).order('users.last_name')
            # flash[:notice] = "No records found based on the search." if @alumni.blank?
        else
            alumni_role = Role.where(name: "Alumni").first
            @alumni = User.where(role: alumni_role).order(:last_name)        
            @alumni_info = Alumnus.joins(:user).order('users.last_name')
            # flash[:notice] = "No records found in Database." if @alumni.blank?
        end
    end

    def show
        alumni_role = Role.where(name: "Alumni").first
        @alumni = Alumnus.all       
        @alumni_info = Alumnus.joins(:user).order('users.last_name')
        # @alumnus = User.find(params[:id])
        # @alumnus_info = Alumnus.where('user_id = ' + String(params[:id])).first
        #@alumnus_handles = MediaHandle.where('user_id = ' + String(params[:id]))
    end

   
end
