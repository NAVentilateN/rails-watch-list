class BookmarksController < ApplicationController
  def new
    @bookmark = Bookmark.new
    @list = List.find(params[:list_id])
    # @movie = Movie.new
    # url = URI.open('http://tmdb.lewagon.com/movie/top_rated').read
    # movie_list = JSON.parse(url)['result']
    # movie_list.each do |movie|
    #   Movie.save(movie)
    # end
    @movie_instances = Movie.all
  end

  def create
    @list = List.find(params[:list_id])
    @bookmark = @list.bookmarks.build(bookmark_params)
    if @bookmark.save
      redirect_to list_path(@list)
    else
      render :new
    end

    # @bookmark = @list.bookmarks.create(bookmark_params)
  end

  def delete
  end

  def bookmark_params
    params.require(:bookmark).permit(:movie_id, :comment)
  end
end
