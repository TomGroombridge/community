class AddEndTimeAndBenefitsToCourses < ActiveRecord::Migration
  def change
    add_column :courses, :benefits, :string
    add_column :courses, :end_time, :datetime
  end
end
