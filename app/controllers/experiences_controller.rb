class ExperiencesController < ApplicationController
  before_action :require_sign_in

  def new
    @experience = current_user.experiences.new
  end
end