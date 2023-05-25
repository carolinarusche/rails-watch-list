class BookmarksController < ApplicationController
  def new
    @list = List.find(params[:list_id])
    @bookmark = Bookmark.new
  end

  def create
    @list = List.find(params[:list_id])
    @movie = Movie.find(params[:bookmark][:movie_id])
    @bookmark = Bookmark.new(bookmark_params)
    @bookmark.list = @list
    @bookmark.movie = @movie
    @bookmark.save
    redirect_to @list
  end

  def destroy
    @bookmark = Bookmark.find(params[:bookmark_id])
    @bookmark.destroy
    redirect_to @list, status: :see_other
  end

  private

  def bookmark_params
    params.require(:bookmark).permit(:comment)
  end
end
