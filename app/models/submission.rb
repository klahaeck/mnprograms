class Submission < ActiveRecord::Base
  #attr_accessible :applicant_id, :statement, :submission_id, :type_id, :title, :url, :image, :resume
  
  belongs_to :applicant
  has_many :works, :dependent => :destroy
  
  has_attached_file :resume,
                  :url  => "/assets/submissions/:id/:basename.:extension",
                  :path => ":rails_root/public/assets/submissions/:id/:basename.:extension"

  #validates_attachment_presence :resume
  validates_attachment_size :resume, :less_than => 10.megabytes
  #validates_attachment_content_type :resume, :content_type => ['application/pdf', 'application/msword']
  
  accepts_nested_attributes_for :works, :reject_if => lambda { |a| a[:title].blank? }
end
