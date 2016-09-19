class Ability
  include CanCan::Ability

  def initialize(user)
    if user
      can :manage, Video
      can :manage, Category
    else 
      can :read, Category
      can :read, Video
    end
  end
end
