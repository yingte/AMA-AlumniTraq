class DirectoryController < ApplicationController
    def index
    end

    def search
        # Get all alumni users
        alumni_role = Role.where(name: "Alumni").first
        @users = User.where(role: alumni_role).order(:last_name)

        # If doing keyword search, apply query
        if params[:search].present?
            # Protect from SQL injection
            keyword = User.sanitize_sql_like(params[:search]).downcase + "%"

            # Get any foreign keys
            majors = Major.where("lower(name) LIKE ?", keyword)
            job_categories = JobCategory.where("lower(name) LIKE ?", keyword)

            #User specific info
            @users =
                @users.where("lower(first_name) || ' ' || lower(last_name) LIKE ?", keyword)
                .or(@users.where(major: [majors]))
                .or(@users.where("CAST(graduation_year AS varchar) LIKE ?", keyword))
            
            # Alumnus specific info
            @alumni = Alumnus.all
            @alumni =
                @alumni.where(job_category: [job_categories])
                .or(@alumni.where("lower(job_title) LIKE ?", keyword))
                .or(@alumni.where("lower(employer) LIKE ?", keyword))

            # Join them together
            

            # flash[:notice] = "No records found based on the search." if @alumni.blank?
        end
    end

    def show
        @user = User.find(params[:id])
    end
end
