class CertificationsController < ApplicationController
  before_filter :authenticate_user!
  authorize_resource

  inherit_resources
  belongs_to :user, :optional => true
  actions :all, :except => [:show]

  private

  def collection
    @certifications ||= end_of_association_chain.accessible_by(current_ability).includes(:position, :user).group('certifications.id').paginate(:page => params[:page])
  end
end
