class Jurorship < ActiveRecord::Base
  belongs_to :program
  belongs_to :user
end
