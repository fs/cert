class SkillsController < ApplicationController
  inherit_resources
  belongs_to :skill_type
  actions :all, :except => [:show]

  protected

   def create_resource(object)
    object.position = Position.find(params[:position_id])
    object.save
  end

  def collection
    @positions ||= Position.all
  end
end
