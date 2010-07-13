class User < ActiveRecord::Base
  has_many :jurorships
  has_many :programs, :through => :jurorships
  
  # Include default devise modules. Others available are:
  # :http_authenticatable, :token_authenticatable, :confirmable, :lockable, :timeoutable, :activatable
  devise :database_authenticatable, :recoverable,
         :rememberable, :trackable, :validatable, :registerable, :activatable

  # Setup accessible (or protected) attributes for your model
  attr_accessible :username, :email, :password, :password_confirmation, :role
end
