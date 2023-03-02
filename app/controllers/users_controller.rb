class UsersController < ApplicationController
    def new
        @user = User.new
    end

    def create
        @user = User.new(user_params)
        if @user.save
          
          flash[:notice] = 'アカウントを登録しました'
          redirect_to tasks_path
        else
          render :new
        end

    end

    def show
        @user = User.find(params[:id])
    end

    private

    def user_params
      params.require(:user).permit(:name, :email, :password, :password_confirmation)
    end

    def correct_user
      @user = User.find(params[:id])
      redirect_to current_user unless current_user?(@user)
    end
end
