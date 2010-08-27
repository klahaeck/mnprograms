class Juror < ActiveRecord::Base
  ajaxful_rater
  
  has_many :jurorships
  has_many :programs, :through => :jurorships
  
  validates_uniqueness_of :name, :email, :case_sensitive => false
  validates_presence_of :name, :email
  
  # Include default devise modules. Others available are:
  # :http_authenticatable, :token_authenticatable, :confirmable, :lockable, :timeoutable and :activatable, :registerable, 
  devise :database_authenticatable, :recoverable,
         :rememberable, :trackable, :validatable

  # Setup accessible (or protected) attributes for your model
  attr_accessible :name, :email, :password, :password_confirmation
  
end
