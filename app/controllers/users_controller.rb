class UsersController < ApplicationController

    before_action :authenticate_user!, only: [:create, :destroy, :show] 
  
      def index
          @users = User.all
      end

      
      def show
        @user = User.find(params[:id])
      end

  
      def update
        @user = User.find(params[:id])
        user = params[:user]
         
      
        if @user.update(first_name: user[:first_name],
            last_name: user[:last_name],
            description: user[:description])
          redirect_to user_path
          flash[:success] = "Ton profil a été enregistré ! "
        else
          render edit_user_path
        end
      end
      
        private 
      
        def users_params  
          params.require(:user).permit(:first_name, :last_name, :description, :email, :age, :password, :password_confirmation)
        end
  
        def authenticate_user
          unless current_user
            flash[:danger] = "Please log in."
            redirect_to new_user_session_path
          end
        end
  end