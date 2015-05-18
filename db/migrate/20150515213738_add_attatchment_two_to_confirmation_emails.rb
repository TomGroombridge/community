class AddAttatchmentTwoToConfirmationEmails < ActiveRecord::Migration
  def change
    add_column :confirmation_emails, :attachment_two, :string
  end
end
