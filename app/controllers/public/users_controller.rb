class Public::UsersController < ApplicationController
  def my_page
    #@medium = current_user.CategoryMedium.find(params[:id])
  end

  def quit
  end

  def index
    @users = User.all
  end

  def show
    @user = User.find(params[:id])
  end

  def edit
  end
end
