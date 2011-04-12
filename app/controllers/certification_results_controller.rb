class CertificationResultsController < ApplicationController
  before_filter :authenticate_user!, :authorize_certification_report!
  helper_method :resource

  def edit
  end

  def update
    attributes = {
            :finished_at => Time.now,
            :result => params[:certification][:result]
    }

    if resource.update_attributes(attributes)
      redirect_to(certifications_path)
    else
      render :action => 'edit'
    end
  end

  private

  def resource
    @certification ||= Certification.find(params[:certification_id], :include => :position)
  end

  def authorize_certification_report!
    authorize! :read, resource
  end
end
