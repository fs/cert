class PositionsController < ApplicationController
  inherit_resources
  actions :all, :except => [:show]

  protected

  def collection
    @positions ||= end_of_association_chain.paginate(:page => params[:page])
  end
end
