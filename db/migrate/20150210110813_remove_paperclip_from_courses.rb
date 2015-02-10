class RemovePaperclipFromCourses < ActiveRecord::Migration
  def change
  	remove_column :courses, :image_file_name, :string
  	remove_column :courses, :image_content_type, :string
  	remove_column :courses, :image_file_size, :integer
  	remove_column :courses, :image_updated_at, :datetime  	
  end
end
