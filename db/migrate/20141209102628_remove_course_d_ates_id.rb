class RemoveCourseDAtesId < ActiveRecord::Migration
  def change
  	remove_column :payments, :course_dates_id, :integer  	
  end
end
