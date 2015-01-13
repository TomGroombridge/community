class CreateBrings < ActiveRecord::Migration
  def change
    create_table :brings do |t|
      t.integer :course_id
      t.string :name

      t.timestamps
    end
  end
end
