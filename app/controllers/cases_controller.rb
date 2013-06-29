class CasesController < ApplicationController

  def new
    @case = Case.new
  end

  def create
    @case = Case.new(params[:case].permit(:name, :path))
   
    if @case.save
      redirect_to @case
    else
      render 'new'
    end
  end

  def index
    @cases = Case.all
  end

  def show
    @case = Case.find(params[:id])
  end

  def edit 
    @case = Case.find(params[:id])
  end

  def update
  end

  def delete
  end

end
