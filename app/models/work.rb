class Work < ActiveRecord::Base
  #attr_accessible :submission_id, :type_id, :title, :url, :image, :document
  
  belongs_to :submission
  belongs_to :type
  
  validates_presence_of :title
  
  has_attached_file :image, :styles => { :icon => "55x55>", :small => "100x100>", :med => "200x200>", :large => "800x800>" },
                  :url  => "/assets/submissions/:id/:basename_:style.:extension",
                  :path => ":rails_root/public/assets/submissions/:id/:basename_:style.:extension"

  #validates_attachment_presence :image
  validates_attachment_size :image, :less_than => 2.megabytes
  validates_attachment_content_type :image, :content_type => ['image/jpeg', 'image/pjpeg', 'image/gif', 'image/png', 'image/x-png', 'image/jpg']
  
  
  has_attached_file :document,
                  :url  => "/assets/submissions/:id/:basename.:extension",
                  :path => ":rails_root/public/assets/submissions/:id/:basename.:extension"

  #validates_attachment_presence :document
  validates_attachment_size :document, :less_than => 2.megabytes
  validates_attachment_content_type :document, :content_type => ['application/pdf', 'application/msword']
  
end
