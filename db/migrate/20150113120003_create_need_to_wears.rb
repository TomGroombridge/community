class CreateNeedToWears < ActiveRecord::Migration
  def change
    create_table :need_to_wears do |t|

      t.timestamps
    end
  end
end
