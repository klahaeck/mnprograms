class Submission < ActiveRecord::Base
  attr_accessible :user_id, :program_id, :statement, :resume, :resume_cache, :works_attributes
  
  ajaxful_rateable :stars => 5, :allow_update => true
  
  mount_uploader :resume, ResumeUploader
  
  belongs_to :user
  belongs_to :program
  
  has_many :works, :dependent => :destroy
  accepts_nested_attributes_for :works, :reject_if => lambda { |a| a[:title].blank? }, :allow_destroy => true
  
  validates :statement, :presence => true
  validates :resume, :presence => true
  
end
