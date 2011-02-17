class SkillsController < ApplicationController
  before_filter :authenticate_user!
  authorize_resource

  inherit_resources
  belongs_to :skill_type
  actions :all, :except => [:show]

  before_filter :load_position, :only => [:create, :new]
  before_filter :load_positions, :only => [:index]

  protected

  def collection
    @skills ||= end_of_association_chain.index_and_group_by(&:position_id)
  end

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
