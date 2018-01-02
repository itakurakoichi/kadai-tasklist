module SessionsHelper
	# 現在ログインしているユーザを取得するメソッド
	# @current_user に既に現在のログインユーザが代入されていたら何もせず、
	# 代入されていなかったら User.find(...) からログインユーザを取得
  def current_user
  	# ショートハンド
    # @current_user ||= User.find_by(id: session[:user_id])

		if @current_user
			return @current_user
		else
			# @current_user = User.find(session[:user_id]) にはしない
			@current_user = User.find_by(id: session[:user_id])
			return @current_user
		end
  end

	# ユーザがログインしていれば true を返し、ログインしていなければ false 
  def logged_in?
  	# ショートハンド
    # !!current_user

		if current_user
			return true
		else
			return false
		end
  end
end