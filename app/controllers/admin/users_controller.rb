class Admin::UsersController < Admin::BaseController
  
  def edit
    @user = User.find_by(slug: params[:slug])
  end

  def update
    @user = User.find(params[:slug])
    @user.update(user_params)
    flash[:notice] = "#{@user.name} was updated"

    redirect_to user_path(@user.slug)
  end

  private

    def user_params
      params.require(:user).permit(:first_name, :last_name, :email, :password)
    end
end
