class UsersController < ApplicationController
  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    if @user.save
      redirect_to :root, notice: "Successfully Registerd"
    else
      flash[:alert] = "Something bad happened, try again!"
      render :new
    end
  end

  def show
    @user = User.find(params[:id])
  end

  def destroy
    @user = User.find(params[:id])
    @user.destroy
    redirect_to :root, notice: "Successfully deleted user"
  end

  def edit
    @user = User.find(params[:id])
  end

  def update
    @user = User.find(params[:id])
    if @user.update_attributes(user_params)
      redirect_to users_path(@user)
    else
      flash[:alert] = "Something bad happened, try again"
      render :edit
    end
  end

  private
    def user_params
      params.require(:user).permit(:first_name, :last_name, :username, :email, :password, :password_confirmation, :role)
    end
end
