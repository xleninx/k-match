class Ability
  include CanCan::Ability

  def initialize(user)
    user ||= User.new 
    can :manage, :all
    unless user.admin?
      cannot :manage, ActiveAdmin::Page, :name => "prospective"
    end
  end
end
