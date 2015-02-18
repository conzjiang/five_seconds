class ExperiencesController < ApplicationController
  before_action :require_sign_in

  def new
    @experience = current_user.experiences.new
  end

  def create
    @experience = current_user.experiences.new(experience_params)
    assign_company

    if @experience.save
      params[:add] ? redirect_to(new_experience_url) : redirect_to(root_url)
    else
      flash[:errors] = @experience.errors.full_messages
      render :new
    end
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

  def assign_company
    AssignCompany.new(@experience, params).call
  end
end