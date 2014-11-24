class AddCourseIdToPayments < ActiveRecord::Migration
  def change
    add_column :payments, :course_id, :integer
   end
end
