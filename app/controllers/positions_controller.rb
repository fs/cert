class PositionsController < ApplicationController
  inherit_resources

  protected

  def collection
    @positions ||= end_of_association_chain.paginate(:page => params[:page])
  end
end
