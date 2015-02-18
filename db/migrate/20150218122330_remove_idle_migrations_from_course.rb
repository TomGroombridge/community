class RemoveIdleMigrationsFromCourse < ActiveRecord::Migration
  def change
  	remove_column :courses, :need_to_bring, :string
  	remove_column :courses, :benefits, :string
  	remove_column :courses, :need_to_wear, :string
  end
end
