class SessionsController < ApplicationController
  def create
    user = User.find_by(name: params[:session][:name])
    # user に値が入っていない場合はログインできないのでelse に進む
    if user && user.authenticate(params[:session][:password]) # authenticate method でuser の認証のための値が正しいかを確認している
       session[:user_id] = user.id
       redirect_to mypage_path
    else
      render 'home/index'
    end
  end

  def destroy
    session.delete(:user_id)
    redirect_to root_path
  end
end
