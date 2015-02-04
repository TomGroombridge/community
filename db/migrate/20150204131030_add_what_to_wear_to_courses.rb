class AddWhatToWearToCourses < ActiveRecord::Migration
  def change
  	add_column :courses, :what_to_wear, :text
  	add_column :courses, :what_to_bring, :text
  	add_column :courses, :experience, :text
  end
end
