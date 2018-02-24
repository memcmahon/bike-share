class UsersController < ApplicationController


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
    @user.update(user_params)
    flash[:notice] = "#{@user.name} was updated"
    if @user.save

    redirect_to user_path(@user.slug)
  end

  private

    def user_params
      params.require(:user).permit(:first_name, :last_name, :email, :password)
    end
end
