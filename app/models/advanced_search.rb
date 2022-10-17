class AdvancedSearch
    include ActiveModel::Model

    attr_accessor :first_name, :last_name, :major_id, :graduation_year, :job_category_id, :job_title, :employer

    def search
        #User specific info
        users = User.alumni_users
        users = users.where("lower(first_name) LIKE ?", process(first_name)) if first_name.present?
        users = users.where("lower(last_name) LIKE ?", process(last_name)) if last_name.present?
        users = users.where(major_id: major_id) if major_id.present?
        users = users.where("CAST(graduation_year AS varchar) LIKE ?", process(String(graduation_year))) if graduation_year.present?
        
        # Alumnus specific info
        alumni = Alumnus.all
        alumni = alumni.where(job_category_id: job_category_id) if job_category_id.present?
        alumni = alumni.where("lower(job_title) LIKE ?", process(job_title)) if job_title.present?
        alumni = alumni.where("lower(employer) LIKE ?", process(employer)) if employer.present?
        alumni = alumni.select(:user_id)  # Get just the user ID

        # Take the intersection of the two sets
        User.find_by_sql("SELECT u.* FROM (#{users.to_sql}) AS u INNER JOIN (#{alumni.to_sql}) AS a ON u.id = a.user_id")
        #users.joins(alumni).order(:last_name)

        # Implicitly return all the users from the union sorted by last name
        #User.where(id: matches.pluck(:id)).order(:last_name)
    end

    private
        # Protect from SQL injection
        def process(input)
            "%" + User.sanitize_sql_like(input).downcase + "%"
        end
end
