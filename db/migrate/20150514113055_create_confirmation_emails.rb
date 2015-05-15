class CreateConfirmationEmails < ActiveRecord::Migration
  def change
    create_table :confirmation_emails do |t|
      t.integer :course_id
      t.text :content

      t.timestamps
    end
  end
end
