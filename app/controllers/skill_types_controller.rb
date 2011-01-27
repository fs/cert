class SkillTypesController < ApplicationController
  inherit_resources

  protected

  def collection
    @skill_types ||= end_of_association_chain.paginate(:page => params[:page])
  end
end
