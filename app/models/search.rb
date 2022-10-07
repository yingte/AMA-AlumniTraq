class Search < ApplicationRecord

    def search_alumni
        # alumni = Alumnus.all

        alumni = User.where(["first_name LIKE ?", "%#{first_name}%"]) if first_name.present?
        alumni = User.where(["last_name LIKE ?", "%#{last_name}%"]) if last_name.present?
        alumni = User.where(["major LIKE ?", "%#{major}%"]) if major.present?

        return alumni
    end

end
