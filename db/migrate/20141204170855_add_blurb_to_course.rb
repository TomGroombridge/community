class AddBlurbToCourse < ActiveRecord::Migration
  def change
    add_column :courses, :blurb, :string
  end
end
