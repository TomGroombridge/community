class AddQuantityToCourseDates < ActiveRecord::Migration
  def change
    add_column :course_dates, :quantity, :integer
  end
end
