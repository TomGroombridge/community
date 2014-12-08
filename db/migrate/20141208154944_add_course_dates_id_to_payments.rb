class AddCourseDatesIdToPayments < ActiveRecord::Migration
  def change
    add_column :payments, :course_dates_id, :integer
  end
end
