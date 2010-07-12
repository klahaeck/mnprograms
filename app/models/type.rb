class Type < ActiveRecord::Base
  attr_accessible :title
  
  belongs_to :work
end
