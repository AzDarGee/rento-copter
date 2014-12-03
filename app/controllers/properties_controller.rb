class PropertiesController < ApplicationController
  before_action :ensure_logged_in, only: [:new, :create, :edit, :update, :destroy]

  def index
    @property = Property.new
    @properties = if params[:search]
       Property.where("LOWER(title) LIKE LOWER(?)", "%#{params[:search]}%")
    else
      @properties = Property.all
    end

    respond_to do |format|
      format.html
      format.js
      format.json { render json: @properties }
    end


  end

  def new
    @property = Property.new
  end

  def create
    @property = current_user.properties.build(property_params)
    @property.user = current_user
    if @property.save
      redirect_to @property, notice: "Successfully created your property listing"
    else
      flash.now[:alert] = "Could not create your listing, try again"
      render :new
    end
  end

  def show
    @property = Property.find(params[:id])
    @visitation = @property.visitations.build
  end

  def edit
    @property = Property.find(params[:id])
  end

  def update
    @property = Property.find(params[:id])
    if @property.update_attributes(property_params)
      redirect_to @property
    else
      flash.now[:alert] = "Something bad happened, try again"
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
      params.require(:property).permit(:title,:description,:address,:rent, :num_rooms, :num_bathrooms,:num_accomodates, :type_prop)
    end
end
