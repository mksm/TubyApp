class Ability
  include CanCan::Ability

  def initialize(user)
    if user
      can :manage, Video
    else 
      can :read, Category
      can :read, Video
    end
  end
end
