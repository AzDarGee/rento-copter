class PropertiesController < ApplicationController
  def index
    @properties = Property.all
  end

  def new
    @property = Property.new
  end

  def create
    @property = Property.new(property_params)
    if @property.save
      redirect_to properties_path(@property), notice: "Successfully created your property listing"
    else
      flash[:alert] = "Could not create your listing, try again"
      render :new
    end
  end

  def show
    @property = Property.find(params[:id])
  end

  def edit
    @property = Property.find(params[:id])
  end

  def update
    @property = Property.find(params[:id])
    if @property.update_attributes(property_params)
      redirect_to properties_path(@property)
    else
      flash[:alert] = "Something bad happened, try again"
      render :edit
    end
  end

  def destroy
    @property = Property.find(params[:id])
    @property.destroy
    redirect_to root_path, notice: "Your listing was deleted"
  end

  def search
  end

  private
    def property_params
      params.require(:property).permit(:title,:description,:address,:rent)
    end
end
