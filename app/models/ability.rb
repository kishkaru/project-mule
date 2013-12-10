class Ability
  include CanCan::Ability

  def initialize(user)
    # Define abilities for the passed in user here. For example:
    #
    #   user ||= User.new # guest user (not logged in)
    #   if user.admin?
    #     can :manage, :all
    #   else
    #     can :read, :all
    #   end
    #
    # The first argument to `can` is the action you are giving the user 
    # permission to do.
    # If you pass :manage it will apply to every action. Other common actions
    # here are :read, :create, :update and :destroy.
    #
    # The second argument is the resource the user can perform the action on. 
    # If you pass :all it will apply to every resource. Otherwise pass a Ruby
    # class of the resource.
    #
    # The third argument is an optional hash of conditions to further filter the
    # objects.
    # For example, here the user can only update published articles.
    #
    #   can :update, Article, :published => true
    #
    # See the wiki for details:
    # https://github.com/ryanb/cancan/wiki/Defining-Abilities
 
    user ||= User.new #guest login to Customer
    
    if not user.admin?
      can :menu, DeliveryArea
      can :pts, DeliveryArea
      can :show, Menu
      can :addItemToCart, Item
      can :minusItemFromCart, Item
      can :addItemToCart, Item
      can :getOldQuantity, Item
      can :removeItemFromCart, Item
      can :show, Order, :user_id => user.id 
      can :account, User
    else
      can :manage, :all
    end

    if user.role == User::SERVER
#can :orders, DeliveryArea
     can :update_picked_up, Order
     can :un_update_picked_up, Order
     can :spam_user, DeliveryPoint
     can :mass_spam_user, DeliveryPoint
     can :orders, DeliveryArea
    end
  end
end
