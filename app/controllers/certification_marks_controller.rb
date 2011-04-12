class CertificationMarksController < ApplicationController
  before_filter :authenticate_user!
  authorize_resource

  inherit_resources
  belongs_to :certification
  actions :all, :except => [:show]
  respond_to :html, :js

  def update
    update! do |format|
      format.js { render :action => 'create' }
    end
  end

  private

  def collection
    @skills ||= parent.position.skills
    @skills_by_skill_type ||= @skills.index_and_group_by(&:skill_type_id)

    @certification_marks_by_skill ||= parent.certification_marks.where(:user_id => current_user.id).index_by(&:skill_id)
    @certification_marks ||= {}

    @skills.each do |skill|
      @certification_marks[skill.id] ||= @certification_marks_by_skill[skill.id] || @certification.certification_marks.build(:skill_id => skill.id)
    end
  end

  def create_resource(object)
    if end_of_association_chain.exists?(:skill_id => params[resource_request_name][:skill_id], :user_id => current_user.id)
      object.update_attributes(params[resource_request_name])
    else
      object.user = current_user
      object.save
    end
  end
end
