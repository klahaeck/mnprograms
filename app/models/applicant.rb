class Applicant < ActiveRecord::Base
  attr_accessible :program_id, :firstname, :lastname, :address, :city, :zip, :phone, :email, :website
  
  #validates_presence_of :firstname, :lastname, :address, :city, :zip, :phone, :email, :website
    
  belongs_to :program
  has_many :submissions, :dependent => :destroy
    
end
