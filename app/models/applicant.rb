class Applicant < ActiveRecord::Base
  attr_accessible :program_id, :firstname, :lastname, :address, :city, :zip, :phone, :email, :website
  
  validates_presence_of :firstname, :lastname, :address, :city, :zip, :phone, :email, :website
  
  validates_format_of :email, 
  					  :with => /^([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})$/i,
  					  :message => 'email must be valid'
  					  
  validates_uniqueness_of :email
  					  
  validates_format_of :firstname, 
  					  :with => /^[A-Za-z.]*\z/, 
  					  :message => "Cannot contain Numbers,White Space"
 
  validates_format_of :lastname, 
  					  :with => /^[A-Za-z.]*\z/, 
  					  :message => "Cannot contain Numbers,White Space"
  					  
  validates_format_of :zip,
                      :with => %r{\d{5}(-\d{4})?},
                      :message => "should be 12345 or 12345-1234"
    
  belongs_to :program
  has_many :submissions, :dependent => :destroy
  
  named_scope :program
    
end
