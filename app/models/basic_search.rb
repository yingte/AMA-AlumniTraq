class BasicSearch
    include ActiveModel::Model

    attr_accessor :keyword

    def search
        # Get all alumni users
        users = User.alumni_users

        # Protect from SQL injection
        processed_keyword = "%" + User.sanitize_sql_like(keyword).downcase + "%"

        # Get any foreign keys
        majors = Major.where("lower(name) LIKE ?", processed_keyword)
        job_categories = JobCategory.where("lower(name) LIKE ?", processed_keyword)

        #User specific info
        users =
            users.where("lower(first_name) || ' ' || lower(last_name) LIKE ?", processed_keyword)
            .or(users.where(major: [majors]))
            .or(users.where("CAST(graduation_year AS varchar) LIKE ?", processed_keyword))
        users = users.select(:id)  # Get just the user ID
        
        # Alumnus specific info
        alumni = Alumnus.all
        alumni =
            alumni.where(job_category: [job_categories])
            .or(alumni.where("lower(job_title) LIKE ?", processed_keyword))
            .or(alumni.where("lower(employer) LIKE ?", processed_keyword))
        alumni = alumni.select(:user_id)  # Get just the user ID

        # Combine the queries together manually
        matches = User.find_by_sql("(#{users.to_sql}) UNION (#{alumni.to_sql})")

        # Implicitly return all the users from the union sorted by last name
        User.where(id: matches.pluck(:id)).order(:last_name)
    end

end
