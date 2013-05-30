class Ability
  include CanCan::Ability


  def initialize(user)
   
   if user.try(:admin?)
     can :manage, :all #:all excepts all models
    else
      can :read, :all
  end
end
end