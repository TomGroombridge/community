class AddNeedToWearToCourses < ActiveRecord::Migration
  def change
    add_column :courses, :need_to_wear, :string    
  end
end
