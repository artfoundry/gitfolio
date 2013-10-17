class DevelopersController <ApplicationController
  def show
    @developer = Developer.find(params[:id])
    @projects = @developer.projects
  end
end