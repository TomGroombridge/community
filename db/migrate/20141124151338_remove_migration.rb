class RemoveMigration < ActiveRecord::Migration
  def change
  	remove_column :courses, :datetime
  	remove_column :courses, :course_date
  end
end
