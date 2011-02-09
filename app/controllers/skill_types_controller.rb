class SkillTypesController < ApplicationController
  before_filter :authenticate_user!
  authorize_resource
  
  inherit_resources
  actions :all, :except => [:show]

  protected

  def collection
    @skill_types ||= end_of_association_chain.paginate(:page => params[:page])
  end
end
