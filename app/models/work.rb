class Work < ActiveRecord::Base
  attr_accessible :submission_id, :type_id, :title, :link, :image, :image_cache
  
  mount_uploader :image, ImageUploader
  
  belongs_to :submission
  belongs_to :type
  
  validates :title, :presence => true
  # validates_size_of :image, :maximum => 2000000, :message => "The image file is too big, it must be smaller than 2 MB!"
  
end
