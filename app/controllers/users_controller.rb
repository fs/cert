class UsersController < ApplicationController
  inherit_resources
  actions :all, :except => [:show, :new, :create]

  def update_resource(object, attributes)
    object.role_ids = attributes[:role_ids]
    super
  end
end
