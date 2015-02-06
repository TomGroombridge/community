class AddMobileNumberToPayments < ActiveRecord::Migration
  def change
    add_column :payments, :mobile_number, :string
  end
end
