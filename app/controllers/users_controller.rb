class UsersController < ApplicationController
  # index,shoにおいて事前にrequire_user_logged_inが実行される。ログインしていなければログインページに強制的にリダイレクトする
  before_action :require_user_logged_in, only: [:index, :show]
  def index
    # 全ユーザ一覧を取得
    @users = User.all.page(params[:page])
  end

  def show
    @user = User.find(params[:id])
  end

  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    # save成功時にはredirect_to root(ログイン画面)いきつく
    if @user.save
      flash[:success] = 'ユーザ登録しました。'
      redirect_to root_url
      # save失敗時には render :newにいきつく
    else
      flash.now[:danger] = 'ユーザの登録に失敗しました'
      render :new
    end
  end
    
    private
    
    def user_params
      params.require(:user).permit(:name, :email,:password, :password_confirmation)
    end
end
