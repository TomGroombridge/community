class ConfirmationEmail < ActiveRecord::Base
	belongs_to :course
	mount_uploader :attachment_one, AttachmentUploader
	mount_uploader :attachment_two, AttachmentUploader
	mount_uploader :attachment_three, AttachmentUploader

end
