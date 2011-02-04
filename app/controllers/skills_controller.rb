class SkillsController < ApplicationController
  inherit_resources
  belongs_to :skill_type
  actions :all, :except => [:show]

  before_filter :load_position, :only => [:create, :new]

  protected

   def create_resource(object)
    object.position = @position
    object.save
  end

  def collection
    @positions ||= Position.all
  end

  def load_position
    @position ||= Position.find(params[:position_id])
  end
end
