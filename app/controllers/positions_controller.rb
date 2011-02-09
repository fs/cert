class PositionsController < ApplicationController
  before_filter :authenticate_user!
  
  inherit_resources
  actions :all, :except => [:show]

  protected

  def collection
    @positions ||= end_of_association_chain.paginate(:page => params[:page])
  end
end
