class CreateNeedOnCourses < ActiveRecord::Migration
  def change
    create_table :need_on_courses do |t|
      t.string :need_to_bring

      t.timestamps
    end
  end
end
