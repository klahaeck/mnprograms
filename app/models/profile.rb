class Profile < ActiveRecord::Base
  attr_accessible :user_id, :firstname, :lastname, :phone, :street1, :street2, :city, :state, :zip
  
  belongs_to :user
end
