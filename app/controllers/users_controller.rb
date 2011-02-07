class UsersController < ApplicationController
  inherit_resources
  actions :all, :except => [:show, :new, :create]
end
