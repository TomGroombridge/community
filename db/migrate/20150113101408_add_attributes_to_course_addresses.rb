class AddAttributesToCourseAddresses < ActiveRecord::Migration
  def change
  	add_column :course_addresses, :address1, :string
  	add_column :course_addresses, :address2, :string
  	add_column :course_addresses, :city, :string
  	add_column :course_addresses, :county, :string  	
  end
end
