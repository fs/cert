class SkillTypesController < ApplicationController
  before_filter :authenticate_user!
  authorize_resource
  
  inherit_resources
  actions :all, :except => [:show]
end
