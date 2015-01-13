class AddNeedToWearToNeedOnCourse < ActiveRecord::Migration
  def change
  	add_column :need_on_courses, :need_to_wear, :string    
  end
end
