class AddAttatchment1ToConfirmationEmails < ActiveRecord::Migration
  def change
    add_column :confirmation_emails, :attachment_one, :string
  end
end
