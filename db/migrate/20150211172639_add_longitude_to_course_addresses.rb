class AddLongitudeToCourseAddresses < ActiveRecord::Migration
  def change
  	add_column :course_addresses, :longitude, :float
  	add_column :course_addresses, :latitude, :float
  end
end
