module Api
  module V1
    class UsersController < ApplicationController
      skip_before_action :authenticate_request, only: [:create]
      before_action :set_user, only: %i[show update destroy]
      authorize_resource :user, only: %i[index show update destroy]

      def index
        @users = User.all.decorate
        render json: @users, except: [:password_digest, :password_reset_token, :password_token_expiry], status: :ok
      end

      def show
        render json: @user, except: [:password_digest, :password_reset_token, :password_token_expiry],
               methods: :permission_ids, status: :found
      end

      def create
        @user = User.new(create_user_params)
        if @user.save
          render json: @user, status: :created
        else
          render json: { errors: @user.errors.full_messages },
                 status: :unprocessable_entity
        end
      end

      def update
        render json: { errors: @user.errors.full_messages },
               status: :unprocessable_entity unless @user.update(update_user_params)
      end

      def destroy
        if @user.destroy
          render json: @user, status: :ok
        else
          render json: { errors: @user.errors.full_messages }, status: :unprocessable_entity
        end
      end

      private

      def update_user_params
        params.require(:user).permit(:first_name, :last_name, :email, :status, :phone, :avatar,
                                     :password, :password_confirmation, permission_ids: []
        )
      end

      def create_user_params
        params.require(:user).permit(:first_name, :last_name, :email, :phone, :avatar,
                                     :user_type, :password, :password_confirmation,
                                     :status, permission_ids: []
        )
      end

      def set_user
        @user = User.find(params[:id])
      end
    end
  end
end
