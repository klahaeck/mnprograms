class Program < ActiveRecord::Base
  attr_accessible :title, :guidlines, :contact, :logo
  
  has_many :applicants
  
  has_attached_file :logo, :styles => { :icon => "20x20>", :small => "50x50>", :medium => "257x257>" },
                    :url  => "/assets/programs/:id/:basename_:style.:extension",
                    :path => ":rails_root/public/assets/programs/:id/:basename_:style.:extension"

  validates_attachment_presence :logo
  validates_attachment_size :logo, :less_than => 1.megabytes
  validates_attachment_content_type :logo, :content_type => ['image/jpeg', 'image/png', 'image/gif']
end
