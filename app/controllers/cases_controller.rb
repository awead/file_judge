class CasesController < ApplicationController

  def new
    @case = Case.new
  end

  def create
    @case = Case.new(params[:case].permit(:name, :path))
    if @case.save
      redirect_to root_path
    else
      flash.now.alert = ["Unable to build a case from the supplied path. Did you enter it correctly?"]
      render 'new'
    end
  end

  def index
    @cases = Case.all
  end

  def show
    @case = Case.find(params[:id])
    if @case.build
      @tickets = @case.violations
      @case.trial
      @case.save
    end
  end

  def edit 
    @case = Case.find(params[:id])
  end

  def update
    @case = Case.find(params[:id])
    if @case.update(params[:case].permit(:name, :path))
      redirect_to @case
    else
      flash.now.alert = ["Unable to build a case from the supplied path. Did you enter it correctly?"]
      render 'edit'
    end
  end

  def destroy
    @case = Case.find(params[:id])
    @case.delete
    redirect_to root_path
  end

end