class BookmarksController < ApplicationController

  def new
    @bookmark = Bookmark.new
  end

  def create
    @bookmark = Bookmark.new(bookmark_params)
    @list = List.find(@bookmark.list_id)
    if @bookmark.save
      redirect_to list_path(@list)
    end
  end

  def destroy
    @bookmark = Bookmark.find(params[:id])
    @bookmark.destroy
    redirect_to lists_path
  end

  private

  def bookmark_params
    params.require(:bookmark).permit(:movie_id, :list_id, :comment)
  end
end
