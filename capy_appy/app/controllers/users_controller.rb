class UsersController < ApplicationController

    def def create
        @user = User.new(params[:user])
        if @user.save
          redirect_to users_url
        else
          flash[:error] = @user.errors.full_messages
          render :new
        end
    end
    
    
end
