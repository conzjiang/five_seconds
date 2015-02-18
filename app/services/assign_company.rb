class AssignCompany
  attr_reader :experience, :params

  def initialize(experience, params)
    @experience = experience
    @params = params
  end

  def call
    experience.build_company(company_params) unless experience.company.present?
  end

  private
  def company_params
    params.require(:company).permit(:name)
  end
end