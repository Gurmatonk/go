class UsersController < ApplicationController
  before_action :authenticate_user!

  load_and_authorize_resource

  def edit
    @user = User.find(params[:id])
  end

  def update
    @user.assign_attributes user_params
    if @user.save
      name = @user == current_user ? I18n.t(:your_account, scope: [:views, :common]) : "#{I18n.t(:account_of, scope: [:views, :common])} #{@user.name}"
      redirect_to @user, notice: success_message(name: name)
    else
      render 'new'
    end
  end

  def index
    @users = User.all
  end

  def show
    @user = User.find(params[:id])
  end

  private

  def user_params
    params.require(:user).permit(:name)
  end
end
