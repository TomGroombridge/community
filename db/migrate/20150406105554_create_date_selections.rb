class CreateDateSelections < ActiveRecord::Migration
  def change
    create_table :date_selections do |t|
      t.integer :ticket_id
      t.integer :course_date_id

      t.timestamps
    end
  end
end
