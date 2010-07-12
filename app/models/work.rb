class Work < ActiveRecord::Base
  attr_accessible :submission_id, :type_id, :title, :url, :image
  
  belongs_to :submission
  has_one :type
  
  validates_presence_of :title
  
  has_attached_file :image, :styles => { :small => "100x100>", :med => "300x300>" },
                  :url  => "/assets/submissions/:id/:style/:basename.:extension",
                  :path => ":rails_root/public/assets/submissions/:id/:style/:basename.:extension"

  #validates_attachment_presence :image
  validates_attachment_size :image, :less_than => 5.megabytes
  validates_attachment_content_type :photo, :content_type => ['image/jpeg', 'image/png', 'image/gif']
end
