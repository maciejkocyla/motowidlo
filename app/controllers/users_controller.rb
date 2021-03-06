class UsersController < ApplicationController

  before_action :signed_in_user, only: [ :edit, :update, :show ]
  before_action :correct_user, only: [ :edit, :update, :show ]

  def show
    @user = User.find(params[:id])
  end

  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)

    if @user.save
      if params[:categories] && params[:categories].any?
        params[:categories].each do |cat|
          Interest.create(category: Category.find_by(id: cat), user: @user)
        end
      end
      sign_in @user
      flash[:success] = "Witamy w gronie użytkowników Motowidła :) "
      redirect_to @user
    else
      render 'new'
    end
  end

  def edit
    @user = User.find(params[:id])
  end

  def update
    @user = User.find(params[:id])
    if @user.update_attributes(user_params)
      flash['success'] = "profil zaktualizowany"
      redirect_to @user
    else
      render 'edit'
    end
  end
  

  private

  def user_params
    params.require(:user).permit(:name, :email, :password, :password_confirmation, :footnote, :avatar_url)
  end

  def signed_in_user 
    redirect_to zaloguj_url, notice: "nie jesteś zalogowany" unless signed_in?
  end

  def correct_user
    @user = User.find_by(id: params[:id]) 
    redirect_to(root_url) unless current_user?(@user)
  end

end
