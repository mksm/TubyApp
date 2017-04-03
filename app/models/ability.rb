class Ability
  include CanCan::Ability

  def initialize(user)
    if user
      can :manage, Video
      can :manage, Channel
    else
      can :read, Channel
      can :read, Video
    end
  end
end
