class Admin < ActiveRecord::Base
  
  validates_uniqueness_of :username, :email, :case_sensitive => false
  validates_presence_of :username, :email
  
  # Include default devise modules. Others available are:
  # :http_authenticatable, :token_authenticatable, :confirmable, :lockable, :timeoutable, :activatable, :registerable
  devise :database_authenticatable, :recoverable,
         :rememberable, :trackable, :validatable

  # Setup accessible (or protected) attributes for your model
  attr_accessible :username, :email, :password, :password_confirmation, :role
end
