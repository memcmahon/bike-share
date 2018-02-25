class UsersController < ApplicationController
  before_action :check_user, only: [:show]
  
  def new
    @user = User.new()
  end

  def create
    @user = User.new(user_params)
    if @user.save
      session[:user_id] = @user.id
      flash[:notice] = "Logged in as #{current_user.email}."
      redirect_to "/dashboard"
    else
      render :new
    end
  end

  def edit
    @user = current_user
  end

  def update
    @user = current_user
    @user.update(user_params)
    if @user.save && current_user.admin?
      flash[:notice] = "#{@user.first_name} was updated"
      redirect_to admin_dashboard_path
    elsif @user.save && !current_user.admin?
      flash[:notice] = "#{@user.first_name} was updated"
      redirect_to dashboard_path
    else
      flash[:notice] = "Something went wrong, please try again."
      render :edit
    end
  end

  def destroy
    @user = User.find(params[:id])
    @user.destroy
    session.destroy
    redirect_to root_path
  end

  private

    def user_params
      params.require(:user).permit(:first_name, :last_name, :email, :password)
    end
end
