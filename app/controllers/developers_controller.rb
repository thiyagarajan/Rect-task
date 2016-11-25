class DevelopersController < ApplicationController
  before_action :authenticate_user!

  def show
    @developer = Developer.find(params[:id])
  end

  def index
    @developers = Developer.all
  end

  def new
    @developer = Developer.new
  end

  def create
    @developer = Developer.new(developer_params)

    if @developer.save
      flash[:success] = 'Developer saved'
      redirect_to developers_path
    else
      flash[:danger] = 'Developer could not be saved'
      render :new
    end
  end

  private

  def developer_params
    params.require(:developer).permit(:first_name, :last_name)
  end
end
