class UsersController < ApplicationController
before_action :authenticate_user!
before_action :correct_user, only: [:edit,:update]

def correct_user
	@user = User.find_by(id: params[:id])
	unless @user.id == current_user.id
		redirect_to user_path(current_user)
	end
end
	def index
		@user = current_user
		@user_index = User.all
		@book_new = Book.new
	end
	def edit
		@user = current_user
	end
	def show
		@user = User.find(params[:id])
		@book_new = Book.new
	end
	def update
		@user = User.find(params[:id])
		if @user.update(user_params)
			flash[:notice] = 'You have updated user successfully.'
			redirect_to user_path(current_user)
		else
			render 'edit'
		end
	end


private
def user_params
	params.require(:user).permit(:name,:introduction,:profile_image)
end
end
