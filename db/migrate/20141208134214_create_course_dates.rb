class CreateCourseDates < ActiveRecord::Migration
  def change
    create_table :course_dates do |t|
      t.datetime :dates

      t.timestamps
    end
  end
end
