class RemoveCourseDatesId < ActiveRecord::Migration
  def down
  	remove_column :payments, :course_dates_id, :integer  	
  end

  def up
  	add_column :payments, :course_date_id, :integer
  end
end
