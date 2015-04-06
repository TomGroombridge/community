class CreateEntrySelections < ActiveRecord::Migration
  def change
    create_table :entry_selections do |t|
      t.integer :entry_id
      t.integer :course_date_id

      t.timestamps
    end
  end
end
