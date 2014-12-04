class AddNeedToBringToCourse < ActiveRecord::Migration
  def change
    add_column :courses, :need_to_bring, :string
  end
end
