class Ability
  include CanCan::Ability

  def initialize(user)
    
    if user
      
    else 
      can :read, Category
    end
  end
end
