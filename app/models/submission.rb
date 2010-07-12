class Submission < ActiveRecord::Base
  attr_accessible :applicant_id, :statement
  
  belongs_to :applicant
  has_many :works, :dependent => :destroy
  
  validates_presence_of :statement
  
  accepts_nested_attributes_for :works
  
end
