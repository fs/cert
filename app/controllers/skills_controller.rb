class SkillsController < ApplicationController
  before_filter :authenticate_user!
  authorize_resource

  inherit_resources
  belongs_to :skill_type
  actions :all, :except => [:show]

  before_filter :load_position, :only => [:create, :new]
  before_filter :load_positions, :only => [:index]

  protected

   def create_resource(object)
    object.position = @position
    object.save
  end

  def load_positions
    @positions ||= Position.all
  end

  def load_position
    @position ||= Position.find(params[:skill][:position_id])
  end
end
