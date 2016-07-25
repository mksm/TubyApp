class Ability
  include CanCan::Ability

  def initialize(user)
    
    if user
      
    else 
      can :read, Category
      can :read, Video
    end
  end
end
