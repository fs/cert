class CertificationMarksController < ApplicationController
  before_filter :authenticate_user!
  authorize_resource

  inherit_resources
  belongs_to :user, :certification
  actions :all, :except => [:show]
  respond_to :html, :js

  def update
    update! do |format|
      format.js { render :action => 'create' }
    end
  end

  private

  def create_resource(object)
    if end_of_association_chain.exists?(:skill_id => params[resource_request_name][:skill_id], :user_id => current_user.id)
      object.update_attributes(params[resource_request_name])
    else
      object.user = current_user
      object.save
    end
  end
end
