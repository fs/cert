class SkillsController < ApplicationController
  inherit_resources

  protected

  def collection
    @skills ||= end_of_association_chain.paginate(:page => params[:page])
  end
end
