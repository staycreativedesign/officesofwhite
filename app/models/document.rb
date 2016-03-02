class Document < ActiveRecord::Base
  belongs_to :user, required: true
  mount_uploader :file, FileUploader
end
