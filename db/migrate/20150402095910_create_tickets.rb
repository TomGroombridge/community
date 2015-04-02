class CreateTickets < ActiveRecord::Migration
  def change
    create_table :tickets do |t|
      t.string :name
      t.float :price
      t.integer :course_date_id
      t.integer :quantity
      t.timestamps
    end
  end
end
