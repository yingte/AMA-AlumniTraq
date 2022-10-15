class AddJobCategoryToSearches < ActiveRecord::Migration[6.1]
  def change
    add_column :searches, :job_category, :string
  end
end
