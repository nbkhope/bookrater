module Api
  class UsersController < ApplicationController
    before_action :set_user, only: [:show, :update, :destroy]

    def index
      @users = User.all
      render json: @users
    end

    def show
      render json: @user
    end

    # def new
    #   @user = User.new
    # end

    # def edit
    #   @user = User.find(params[:id])
    # end

    def create
      @user = User.new(user_params)

      if @user.save
        render json: @user, status: :created, location: @user
      else
        err
      end
    end

    def update

      if @user.update(user_params)
        head :no_content
      else
        err
      end

    end

    def destroy
      @user.destroy
      head :no_content
    end

    private

    def set_user
      @user = User.find(params[:id])
    end

    def user_params
      params.permit(:username, :email, :password)
    end

    def err
      render json: @user.errors, status: :unprocessable_entity
    end
  end
end