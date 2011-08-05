class Ability
  include CanCan::Ability

  def initialize(user)
    
    # Define abilities for the passed in user here. For example:
    #
    user ||= User.new # guest user (not logged in)
    
    can [:read, :description, :guidelines, :thankyou], Program, :published => true
    
    if user.role? :applicant
      can :update, Profile, :user_id => user.id
      can :manage, Service, :user_id => user.id
      can :create, Submission
      can [:read, :update, :delete], Submission, :user_id => user.id
    end
    
    if user.role? :juror
      cannot :create, Submission
      can :read, Submission
      can :read, Work
      can :rate, Submission
      can :edit, Rate, :rater_id => user.id
    end
    
    if user.role? :editor
      can :manage, Program
      can :manage, Submission
      cannot :create, Submission
      can :manage, Work
    end
    
    if user.role? :admin
      can :manage, :all
      cannot :create, Submission
    end
    
  end
end
