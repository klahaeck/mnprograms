class Juror < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :http_authenticatable, :token_authenticatable, :lockable, :confirmable, :activatable, :timeoutable and 
  devise :registerable, :database_authenticatable, :recoverable,
         :rememberable, :trackable, :validatable

  # Setup accessible (or protected) attributes for your model
  attr_accessible :email, :password, :password_confirmation
end
