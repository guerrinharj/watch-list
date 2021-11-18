class BookmarksController < ApplicationController

  def new
  end

  def create
    @bookmark.new(bookmark_params)
  end

  def destroy
    @bookmark = Bookmark.find(params[:id])
    @bookmark.destroy
    redirect_to lists_path
  end

  private

  def bookmark_params
    params.require(:list).permit(:movie_id, :list_id, :comment)
  end

end
