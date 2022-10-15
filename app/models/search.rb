class Search < ApplicationRecord

    def search_alumni
        alumni = User.all

        if first_name.present?
            alumni = alumni.where(["first_name LIKE ?", "%#{first_name}%"]) 
        end

        if last_name.present?
            alumni = alumni.where(["last_name LIKE ?", "%#{last_name}%"])
        end
        
        if major.present?
            # alumni = Major.where(["name LIKE ?", "%#{major.name}%"])
            alumni = alumni.where(major_id: Integer(major))
        end

        if graduation_year.present?
            alumni = alumni.where(graduation_year: graduation_year) 
        end

        return alumni
    end

end
