class Record < ActiveRecord::Base
  attr_accessible :audio

  mount_uploader :audio, RecordUploader

  scope :desc, order("created_at DESC")

end
