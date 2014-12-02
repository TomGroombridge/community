class CreatePlans < ActiveRecord::Migration
  def change
    create_table :plans do |t|
      t.string :name
      t.decimal :price
      t.integer :processed_payments

      t.timestamps
    end
  end
end
