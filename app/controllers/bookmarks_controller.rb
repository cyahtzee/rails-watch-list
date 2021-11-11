class BookmarksController < ApplicationController
  before_action :current_list, only: [:new, :create]

  def new
    @bookmark = Bookmark.new
  end

  def create
    @bookmark = Bookmark.new(book_params)
    @bookmark.list = @list
    if @bookmark.save
      redirect_to list_path(@list)
    else
      render :new
    end
  end

  def delete
    @bookmark = Bookmark.find(params[:id])
    @bookmark.destroy
  end

  private

  def book_params
    params.require(:bookmark).permit(:comment, :movie_id)
  end

  def current_list
    @list = List.find(params[:list_id])
  end
end
