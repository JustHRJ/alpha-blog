class UsersController < ApplicationController
   
   def new
       @user = User.new
   end
    
    def create
        @user = User.new(user_params)
        if @user.save
            flash[:success] = "User has been successfully Added"
            redirect_to root_path
        else
            render 'new' 
        end
    end
    
    def show
       @user = User.find(params[:id])
    end
    
    def edit
        @user = User.find(params[:id])
    end
    
    def update
        @user = User.find(params[:id])
        if @user.update(user_params)
            flash[:success] = "successfully updated user"
            redirect_to user_path(@user)
        else
            render 'edit'
        end
    end
    
    private 
    def user_params
        params.require(:user).permit(:username, :email, :password)
    end
end