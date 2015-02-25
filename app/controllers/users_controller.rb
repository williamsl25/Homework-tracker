class UsersController < ApplicationController
  before_filter :authenticate_user!
 
  def index
    @users = User.all
  end

  def show
    @user = User.find params[:id]
  end

  def new
    @user = User.new
  end

  def edit
    @user = User.find params[:id]
  end

  def create
    @user = User.new(params[:user])
 
    respond_to do |format|
      if @user.save
        # Tell the UserMailer to send a welcome email after save
        UserMailer.welcome_email(@user).deliver_later
 
        format.html { redirect_to(@user, notice: 'User was successfully created.') }
        format.json { render json: @user, status: :created, location: @user }
      else
        format.html { render action: 'new' }
        format.json { render json: @user.errors, status: :unprocessable_entity }
      end
    end
  end

  def update
    @user = User.find params[:id]
    @user.update user_params
    redirect_to user_path(@user)
  end

  def destroy
    @user = User.find params[:id]
    @user.destroy
    redirect_to users_path
  end

private

  def user_params
    params.require(:user).permit(
      :first_name,
      :last_name,
      :github,
      :admin_status
      )
  end

end

