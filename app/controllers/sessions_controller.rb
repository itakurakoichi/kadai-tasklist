class SessionsController < ApplicationController
  def new
  end

  def create
    hoge = params[:session]
    email = params[:session][:email].downcase
    password = params[:session][:password]
    if login(email, password)
      flash[:success] = 'ログインに成功しました。 >>> #{hoge}'
      redirect_to @user
    else
      flash.now[:danger] = 'ログインに失敗しました。'
      render 'new'
    end
  end

  def destroy
    session[:user_id] = nil
    flash[:success] = 'ログアウトしました。'
    redirect_to root_url
  end

  private

  def login(email, password)
    # 入力フォームの email と同じメールアドレスを持つユーザを検索し @user へ代入、無ければ nil
    @user = User.find_by(email: email)
    
    # @user のパスワードが合っているか、@user.authenticate(password) で確認
    if @user && @user.authenticate(password)
      # ログイン成功
      # session[:user_id] にログインユーザの id が代入された時点でログイン完了
      # ブラウザの Cookie にもログイン情報が保存されます。
      session[:user_id] = @user.id
      return true
    else
      # ログイン失敗
      return false
    end
  end
end
