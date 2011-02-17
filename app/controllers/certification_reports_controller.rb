class CertificationReportsController < ApplicationController
  before_filter :authenticate_user!
  before_filter :load_user, :load_certification, :load_skills, :authorize_certification_report!

  def show
  end

  private

  def load_user
    @user ||= User.find(params[:user_id])
  end

  def load_certification
    @certification ||= Certification.find(params[:certification_id], :include => :position)
  end

  def load_skills
    @skills ||= @certification.position.skills.index_and_group_by(&:skill_type_id)

    @certification_marks_by_skills ||= {}
    @certification.certification_marks.index_and_group_by(&:skill_id).each do |skill_id, marks|
      @certification_marks_by_skills[skill_id] ||= marks.index_by(&:user_id)
    end
  end

  def authorize_certification_report!
    authorize! :read, @certification
  end
end
