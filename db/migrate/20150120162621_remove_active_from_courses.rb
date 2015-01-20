class RemoveActiveFromCourses < ActiveRecord::Migration
  def change
  	remove_column :courses, :active, :boolean
  end
end
