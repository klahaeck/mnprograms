class Program < ActiveRecord::Base
  attr_accessible :title, :guidlines, :contact, :logo
  
  validates_presence_of :title, :guidelines, :contact
  validates_uniqueness_of :title
  
  has_many :jurorships
  has_many :users, :through => :jurorships
  
  has_many :applicants
  
  has_friendly_id :title, :use_slug => true,
    # remove accents and other diacritics from Western characters
    :approximate_ascii => true
  
  has_attached_file :logo, :styles => { :icon => "20x20>", :small => "50x50>", :medium => "257x257>" },
                    :url  => "/assets/programs/:id/:basename_:style.:extension",
                    :path => ":rails_root/public/assets/programs/:id/:basename_:style.:extension"

  validates_attachment_presence :logo
  validates_attachment_size :logo, :less_than => 1.megabytes
  validates_attachment_content_type :logo, :content_type => ['image/jpeg', 'image/png', 'image/gif']
end
