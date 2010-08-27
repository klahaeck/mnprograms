class Jurorship < ActiveRecord::Base
	belongs_to :juror
	belongs_to :program
end
