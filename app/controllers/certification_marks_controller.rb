class CertificationMarksController < ApplicationController
  before_filter :authenticate_user!
  authorize_resource

  inherit_resources
  belongs_to :certification
  actions :all, :except => [:show]

  private

  def create_resource(object)
    object.user = current_user
    object.save
  end
end
