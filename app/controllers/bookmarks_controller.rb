class BookmarksController < ApplicationController

  def new
  end

  def create
  end

  def destroy
    @bookmark = Bookmark.find(params[:id])
    @bookmark.destroy
    redirect_to lists_path
  end

end
