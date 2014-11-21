class VisitationsController < ApplicationController
  def index
    @visitations = Visitation.all
  end

  def new
    @visitation = Visitation.new
  end

  def create
    @property = Property.find(params[:property_id])
    @visitation = @property.visitations.build(visitation_params)
    @visitation.user = current_user

    if @visitation.save
      redirect_to @visitation.user, notice: "Successfully created an appointment"
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

  private
    def visitation_params
      params.require(:visitation).permit(:start_time,:end_time, :notes, :num_people)
    end
end
