class Document < ActiveRecord::Base
	has_attached_file :file

	belongs_to :user, :foreign_key => :owner_id

	do_not_validate_attachment_file_type :file
end
