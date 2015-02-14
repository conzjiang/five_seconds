class ExperiencesController < ApplicationController
  before_action :require_sign_in

  def new
    @experience = current_user.experiences.new
  end

  def create
    @experience = current_user.experiences.new(experience_params)

  end

  private
  def experience_params
    params.require(:experience).permit(
      :title,
      :company_id,
      :start_date,
      :end_date
    )
  end

  def item_params
    item_descriptions = params[:items].reject(&:blank?)

    item_descriptions.map do |desc|
      { description: desc }
    end
  end
end