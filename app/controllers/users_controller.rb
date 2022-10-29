class UsersController < ApplicationController

    # @desc Creating user and generating token
    # @request POST /users/
    # @access Public
    def create
    @user = User.create(user_params)
        if @user.valid?
        token = encode_token({user_id: @user.id})
        render json: {user: @user, token: token},status: :created
        else
            render json: {errors: @user.errors}, status: :unprocessable_entity
        end
    end
    # @desc Login, Auth and generating token
    # @request POST /users/login
    # @access Public
    def login
        @user = User.find_by(username: user_params[:username])
        if @user && @user.authenticate(user_params[:password])
            token = encode_token({user_id: @user.id})
            render json: {user: @user, token: token},status: :ok
        else
            render json: {errors: @user.errors}, status: :unprocessable_entity
        end
    end

    private

    def user_params
        params.permit(:username, :password)
    end
end
