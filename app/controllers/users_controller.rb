class UsersController < ApplicationController
    def index
        @users = user.all.order(created_at DESC)
    end

    def show
        @user = User.find(params[:id])
    end

end