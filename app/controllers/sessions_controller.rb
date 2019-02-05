class SessionsController < ApplicationController
  # def new
  # end

  def create
    # emailを取得。paramsにsessions.newフォームデータが代入されていて２段階にして取り出す。downcaseで小文字に変換
    email = params[:session][:email].downcase
    # passwordをsessions.newフォームから取得
    password = params[:session][:password]
    if login(email,password)
      # ログイン成功
      flash[:success] = 'ログインに成功しました'
      redirect_to root_url
    else
      # ログイン失敗
      flash.now[:danger] = 'ログインに失敗しました'
      render 'new'
    end 
  end

  def destroy
    session[:user_id] = nil
    flash[:success] = 'ログアウトしました'
    redirect_to root_url
  end
  
  private
  
# ログイン可能なメッドの定義
  def login(email,password)
    # 入力フォームのemailと同じメールアドレスを持つユーザーを検索
    @user = User.find_by(email: email)
    # 入力フォームのpasswordと同じパスワードを持つユーザーを検索
    if @user && @user.authenticate(password)
      # ブラウザにはcookieとして、サーバにはsessionとしてログインが維持される
      session[:user_id] = @user.id
      return true
    else
       # email,passwordの組み合わせが間違っていた場合にはfalse
      return false
    end
  end
end
