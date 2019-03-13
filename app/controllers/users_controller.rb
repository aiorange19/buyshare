class UsersController < ApplicationController
  def show
    @user = User.find_by(id: params[:id]) 
  end

  def new
    @user = User.new
  end

  def create
     @user = User.new(
         name: params[:user][:name],
         email: params[:user][:email],
         password: params[:user][:password],
         image_name: 'sample.jpg')

    if @user.save
      session[:user_id] = @user.id
      redirect_to("/users/#{@user.id}")
    else
      render('users/new.html.erb')
    end 
  end

  def edit
    @user = User.find_by(id: params[:id])
  end

  def update
    @user = User.find_by(id: params[:id])
      
    if params[:user][:image]
      @user.image_name = "#{@user.id}.jpg" 
      image = params[:user][:image]
      File.binwrite("public/user_images/#{@user.image_name}", image.read)
    end
      
    if @user.update(name: params[:user][:name], email: params[:user][:email], password: params[:user][:password])
        redirect_to("/users/#{@user.id}")
    else
        render('users/edit.html.erb')
    end  
  end

  def login_form
  end

  def login
    @user = User.find_by(email: params[:email])

    if @user && @user.authenticate(params[:password])
      session[:user_id] = @user.id
      redirect_to("/users/#{@user.id}") #仮。タイムライン画面できたらそっちにする
    else
      @email = params[:email]
      @password = params[:password]
      render('users/login_form.html.erb') 
    end  
  end

  def logout
    session[:user_id] = nil
    redirect_to('/login')
  end 
    
end