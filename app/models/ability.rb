class Ability
  include CanCanNamespace::Ability

  def initialize(user)
    can [:read, :create], Game
    can [:update, :destroy], Game, user: user
    can [:read], User, id: user.id
    can [:update, :destroy], User, id: user.id
  end
end
