class ResumesController
  def new
    @resume = current_user.resumes.new
  end
end