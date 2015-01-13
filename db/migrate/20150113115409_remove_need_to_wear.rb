class RemoveNeedToWear < ActiveRecord::Migration
  def change
  	remove_column :need_on_courses, :need_to_wear, :string    
  end
end
