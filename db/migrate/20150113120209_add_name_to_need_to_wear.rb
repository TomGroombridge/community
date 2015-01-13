class AddNameToNeedToWear < ActiveRecord::Migration
  def change
  	add_column :need_to_wears, :name, :string    
  	add_column :need_to_wears, :course_id, :integer
  end
end
