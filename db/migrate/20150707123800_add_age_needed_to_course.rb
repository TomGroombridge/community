class AddAgeNeededToCourse < ActiveRecord::Migration
  def change
    add_column :courses, :age_needed, :boolean
  end
end
