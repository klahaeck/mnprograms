class Program < ActiveRecord::Base
  attr_accessible :title, :url, :description, :guidelines, :contact, :thankyou, :start, :end, :published, :max_work, :logo, :style, :editor_ids, :juror_ids, :cached_slug
  
  has_friendly_id :title, :use_slug => true
  
  validates :title, :presence => true
  validates :start, :presence => true
  validates :end, :presence => true
  # validates :description, :presence => true
  # validates :guidelines, :presence => true
  # validates :contact, :presence => true
  # validates :thankyou, :presence => true
  
  # validates :url, :presence => true, :uniqueness => true
  # validates :logo, :presence => true
  
  mount_uploader :logo, LogoUploader
  mount_uploader :style, StyleUploader
  
  scope :default, Program.where(:default => true)
  scope :published, Program.where(:published => true)
  scope :unpublished, Program.where(:published => false)
  scope :active, Program.published.where({:start.lt => Date.today, :end.gt => Date.today})
  scope :inactive, Program.where({:published => false} | {:start.gt => Date.today} | {:end.lt => Date.today})
  
  has_many :editorships, :dependent => :destroy
  has_many :editors, :through => :editorships, :source => :user, :uniq => true
  
  has_many :jurorships, :dependent => :destroy
  has_many :jurors, :through => :jurorships, :source => :user, :uniq => true
  
  has_many :submissions
  
end
