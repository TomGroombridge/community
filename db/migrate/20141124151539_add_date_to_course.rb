class AddDateToCourse < ActiveRecord::Migration
  def change
    add_column :courses, :Date, :datetime
  end
end
