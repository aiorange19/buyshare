class UsersController < ApplicationController
  def show
    @user = User.find_by(id: params[:id]) #ユーザー情報をidから取得
  end

  def new
    @user = User.new
  end

  def create
     @user = User.new(
         name: params[:name],
         email: params[:email],
         password_digest: params[:password],
         image_name: 'sample.jpg'
         ) #ユーザー情報を作り出す。要素は上記の通り。sample.jpgをデフォルト画像となるよう設定

      if @user.save
        redirect_to("/users/#{@user.id}") #ユーザー新規登録ができた場合「ユーザー詳細画面」に飛ぶ
      else
        render("users/new.html.erb") #うまく登録できなかった場合「新規登録画面」に戻る
      end

  end

  def edit
  end

  def update
  end

  def login_form
  end

  def login
    @user = User.find_by(email: params[:email], password_digest: params[:password]) #ユーザー情報をメアドとパスワードから抽出

    if @user
      session[:user_id] = @user.id
      redirect_to("/users/#{@user.id}") #仮。タイムライン画面できたらそっちにする
    else
      @email = params[:email]
      @password = params[:password]
      render('users/login_form.html.erb') #うまく登録できなかった場合「ログイン画面」に戻る
    end

  end

  def logout
    session[:user_id] = nil
    redirect_to('/login')
  end


end
