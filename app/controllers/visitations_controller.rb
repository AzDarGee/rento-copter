class VisitationsController < ApplicationController
  def index
    @visitations = Visitation.all
  end

  def new
    @visitation = Visitation.new
  end

  def create
    @visitation = Visitation.new(visitation_params)
    if @visitation.save
      redirect_to root_path, notice: "Successfully created an appointment"
    else
      flash.now[:alert] = "Something bad happened, try again"
      render :new
    end
  end

  def show
    @visitation = Visitation.find(params[:id])
  end

  def edit
    @visitation = Visitation.find(params[:id])
  end

  def update
    @visitation = Visitation.find(params[:id])
    if @visitation.update_attributes(visitation_params)
      redirect_to visitations_path(@visitation)
    else
      flash.now[:alert] = "Something bad happened, try again"
      render :edit
    end
  end

  def destroy
    @visitation = Visitation.find(params[:id])
    @visitation.destroy
    redirect_to root_path, notice: "Successfully removed your appointment"
  end
end
