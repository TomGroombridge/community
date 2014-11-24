class AddCourseDateToCourse < ActiveRecord::Migration
  def change
    add_column :courses, :course_date, :string
    add_column :courses, :datetime, :string
  end
end
