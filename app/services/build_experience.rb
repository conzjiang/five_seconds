class BuildExperience
  attr_reader :experience, :params

  def initialize(experience, params)
    @experience = experience
    @params = params
  end

  def call
    assign_company
    build_items
  end

  def assign_company
    experience.build_company(company_params) unless experience.company.present?
  end

  def build_items
    experience.items.new(item_params)
  end

  private
  def company_params
    params.require(:company).permit(:name)
  end

  def item_params
    item_descriptions = params[:items].reject(&:blank?)

    item_descriptions.map do |desc|
      { description: desc }
    end
  end
end