class Submission < ActiveRecord::Base
  #attr_accessible :applicant_id, :statement, :submission_id, :type_id, :title, :url, :image
  
  belongs_to :applicant
  has_many :works, :dependent => :destroy
  
  validates_presence_of :statement
  
  accepts_nested_attributes_for :works, :reject_if => lambda { |a| a[:title].blank? }
end
