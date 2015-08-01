class UsersController < ApplicationController
	def index
	end

	def new
		@user = User.new
	end

	def create
		@user = User.new(user_params)
		if @user.save
			flash[:success] = "Welcome to Twitta!"
			redirect_to @user
		else
			render 'new'
		end
	end

	def show
		@user = User.find(params[:id])
	end

	def edit
	end

	def destroy
	end

	def root
		if current_user
			redirect_to user_path(current_user)
		else
			redirect_to signup_path
		end
	end

	private
	    def current_user
	        current_user = User.find(session[:user_id]) if session[:user_id]
	    end

	    def user_params
	    	params.require(:user).permit(:name, :email, :password, :password_confirmation)
	    end
end
