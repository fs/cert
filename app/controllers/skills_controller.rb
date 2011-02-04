class SkillsController < ApplicationController
  inherit_resources
  belongs_to :skill_type
  actions :all, :except => [:show]

  protected

  def collection
    @positions ||= Position.all
  end
end
