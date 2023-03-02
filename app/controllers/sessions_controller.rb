class SessionsController < ApplicationController
    def new
    end

    def create
        user = User.find_by(email: params[:session][:email].downcase)
        if user&.authenticate(params[:session][:password])
          flash[:notice] = 'ログインしました'
          redirect_to tasks_path
        else
          flash.now[:danger] = 'メールアドレスまたはパスワードに誤りがあります'
          render :new
        end
    end
end
