class BookCommentsController < ApplicationController
  def create
    @book = Book.find(params[:book_id])
    comment = current_user.book_comments.new(book_comment_params)
    comment.book_id = @book.id
    @user = @book.user
    if comment.save
      render :book_comments
    else
      redirect_to book_path(book)
    end
  end
  
  def destroy
    BookComment.find(params[:id]).destroy
    @book = Book.find(params[:book_id])  
    @user = @book.user
    render :book_comments
  end
  
   private
   
   def book_comment_params
     params.require(:book_comment).permit(:comment)
   end
end
