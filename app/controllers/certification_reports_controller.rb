class CertificationReportsController < ApplicationController
  before_filter :authenticate_user!

  before_filter :load_user, :load_certification, :authorize_certification_report!

  def show
  end

  private

  def load_user
    @user ||= User.find(params[:user_id])
  end

  def load_certification
    @certification ||= Certification.find(params[:certification_id])
    @certification_marks_by_skills ||= @certification.certification_marks.index_and_group_by(&:skill_id)
  end

  def authorize_certification_report!
    authorize! :read, @certification
  end
end