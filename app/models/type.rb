class Type < ActiveRecord::Base
  attr_accessible :title
  
  has_many :works
end
