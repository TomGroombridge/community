class AddAttatchmentThreeToConfirmationEmails < ActiveRecord::Migration
  def change
    add_column :confirmation_emails, :attachment_three, :string
  end
end
