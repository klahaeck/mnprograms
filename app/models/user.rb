class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :token_authenticatable, :lockable and :timeoutable, :confirmable
  devise :database_authenticatable, :registerable,
         :recoverable, :trackable, :validatable, :oauthable, :token_authenticatable, :rememberable

  # Setup accessible (or protected) attributes for your model
  attr_accessible :email, :password, :password_confirmation, :remember_me, :username, :role_ids, :haslocalpw, :profile_attributes
  
  ajaxful_rater
  
  has_many :services, :dependent => :destroy
  has_one :profile, :dependent => :destroy
  has_and_belongs_to_many :roles
  has_many :submissions, :dependent => :destroy
  
  has_many :editorships, :dependent => :destroy
  has_many :programs, :through => :editorships, :as => :editor, :uniq => true
  
  has_many :jurorships, :dependent => :destroy
  has_many :programs, :through => :jurorships, :as => :juror, :uniq => true
  
  accepts_nested_attributes_for :profile, :allow_destroy => true
  
  after_create :create_profile
  
  scope :with_role, lambda{ |role| joins(:roles).where(:roles => {:name => role}) }
  scope :jurors, User.with_role('juror')
  scope :editors, User.with_role('editor')
  scope :admins, User.with_role('admin')
  
  def role?(role)
    return !!self.roles.find_by_name(role.to_s)
  end
  
  def fullname
    if self.profile.firstname?
      fullname = self.profile.firstname
      
      if self.profile.lastname?
        fullname += " " + self.profile.lastname
      end
      
      return fullname
    else
      return self.email
    end
  end
  
  def submission(program)
    return self.submissions.find_by_program_id(program.id)
  end
  
  private
  
  def create_profile
    profile = Profile.find_by_user_id(self.id)
    if !profile
      Profile.create(:user_id => self.id)
    end
  end
	
end
