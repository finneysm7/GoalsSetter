class UsersController < ApplicationController  
  
  def new
    @user = User.new
    render :new
  end
  
  def create
    @user = User.new(user_params)
    if @user.save
      log_user_in(@user)
      redirect_to user_url(@user)
    else
      render :new
    end
  end  
  
  def show
    @user = User.find(params[:id])
    render :show
  end
  
  private
  
  def user_params
    params.require(:user).permit(:username, :password)
  end

end
