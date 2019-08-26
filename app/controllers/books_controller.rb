class BooksController < ApplicationController
before_action :authenticate_user!
before_action :corrent_user, only: [:edit, :update]
def corrent_user
	@book = current_user.books.find_by(id: params[:id])
	unless @book
		redirect_to books_path
	end
end
	def index
		@user = User.find(current_user.id)
		@books = Book.all
		@book_new = Book.new
	end

	def show
		@book = Book.find(params[:id])
		@user = @book.user
		@book_new = Book.new
	end

	def edit
		@book = Book.find(params[:id])
		
	end
	def create
		@book_new = Book.new(book_params)
		@book_new.user_id = current_user.id
		if @book_new.save
			flash[:notice] = 'You have creatad book successfully.'
			redirect_to book_path(@book_new.id)
		else
			@user = User.find(current_user.id)
			@books = Book.all
			render 'index'
		end
	end
	def update
		@book = Book.find(params[:id])
		if @book.update(book_params)
			flash[:notice] = 'You have updated book successfully.'
			redirect_to book_path(@book.id)
		else
			render 'edit'
		end
	end
	def destroy
		@book = Book.find(params[:id])
		@book.destroy
		redirect_to books_path
	end


	private
	def book_params
		params.require(:book).permit(:title,:body,:user_id)
	end

end
