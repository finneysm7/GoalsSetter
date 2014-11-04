class SessionsController < ApplicationController
  def new
    @user = User.new
    render :new
  end
  
  def create
    @user = User.find_by_credentials(user_params)
    if @user.nil?
      render :new
    else
      if @user.save
        log_user_in(@user)
        redirect_to user_url(@user)
      else
        render :new
      end
    end
  end  
  
  def show
    @user = User.find(params[:id])
    render :show
  end
  
  def destroy
    log_user_out
    redirect_to new_session_url
  end
  
  private
  
  def user_params
    params.require(:user).permit(:username, :password)
  end
end
