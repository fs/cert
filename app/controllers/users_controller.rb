class UsersController < ApplicationController
  before_filter :authenticate_user!
  authorize_resource
  
  inherit_resources
  actions :all, :except => [:show, :new, :create]

  def update_resource(object, attributes)
    object.role_ids = attributes[:role_ids] if can?(:manage, Role)
    super
  end
end
