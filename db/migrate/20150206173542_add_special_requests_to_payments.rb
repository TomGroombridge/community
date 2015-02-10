class AddSpecialRequestsToPayments < ActiveRecord::Migration
  def change
    add_column :payments, :special_request, :text
  end
end
