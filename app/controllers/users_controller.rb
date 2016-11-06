class UsersController < ApplicationController

  # => app/views/users/show.html.erb
  def show
    @user = User.find(params[:id])
    #debugger
  end
  
  def new
    @user = User.new
  end
  
  def create
    @user = User.new(user_params)
    if @user.save
      # success
      flash[:success] = "Welcome to the Sample App!"
      redirect_to @user
    else
      # failure
      render 'new'
    end
  end

  def user_params
    params.require(:user).permit(
      :name, :email, :password,
      :password_confirmation)
  end
end
