class ApplicationController < ActionController::Base
    before_action :current_user

    private

    def current_user
        return unless session[:user_id] # seesion にuser_id の値がない(ログインしていない)場合はreturn している
        @current_user = User.find_by(id: session[:user_id]) # find_by でuser_id を取得できた(ログインしていた)場合は@current_user に値が格納される
    end
end
