class AddAddresses < ActiveRecord::Migration
  
  def change
    create_table :course_addresses do |t|
    	t.string :address1
    	t.string :address2
    	t.string :city
    	t.string :county
    	t.string :postcode
      t.timestamps
    end
  end

end
