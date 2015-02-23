class UsersController < ApplicationController

  def index
  	@users = User.all
  end

  def new
  	@user = User.new
  end

  def create
  	user = User.new(user_params)
  	if user.save
  		session['user_id'] = user.id
      # PageMailer.visit_happened("person").deliver
  		redirect_to posts_path
  	else
      redirect_to new_user_path
    end
  end

  def show
    @user = User.find(session['user_id'])
    @posts = Post.where(user_id: params[:user_id])
  end

  def user_params
    params.require(:user).permit(:email, :password, :password_confirmation, :avatar)
  end
end
