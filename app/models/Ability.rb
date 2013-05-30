class Ability
  include CanCan::Ability


  def initialize(user)
   
   if user.admin?
     can :manage, :all #:all excepts all models
    else
      can :read, :all
  end
end
end