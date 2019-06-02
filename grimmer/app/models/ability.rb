# frozen_string_literal: true

class Ability
  include CanCan::Ability

  def initialize(user)
    user = user || User.new # for guest
    if user.roles_mask == 0
      can :read, :all #for guest without roles
    elsif user.roles_mask == 1
      just_read
    elsif user.roles_mask == 2
      admin
    elsif user.roles_mask == 3
      superadmin
    end
  end

  def just_read
    can :crud, Post
    can :crud, PostComment
    can :crud, PostVote
    can :crud, PostAttachment
  end

  def admin
    can :manage, [User, Post, Blacklist, Dumpster, UserProfile, PostAttachment, Geofence, Ban]
  end

  def superadmin
    can :manage, :all
  end
end
