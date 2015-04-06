class CreateEntries < ActiveRecord::Migration
  def change
    create_table :entries do |t|
      t.integer :ticket_id

      t.timestamps
    end
  end
end
