class UsersController < ApplicationController
  def show
    @user = User.find_by(id: params[:id])
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
         )
      @user.save
      
      redirect_to("/users/#{@user.id}")
  end
    
  def edit
  end
    
  def update
  end
    
  def login_form
  end
    
  def login
    @user = User.find_by(email: params[:email], password_digest: params[:password])
    
  end
    
  def logout
  end
    
      
end
