class SongsController < ApplicationController
  def index
    @songs = Song.all
  end

  def new
    @song = Song.new
  end

  def create
    @song = Song.new(song_params)
    if @song.save
      redirect_to @song #this will redirect you to the show page, could also go to a index page with 'songs_path'
    else
      flash[:errors] = "Please try again" #a message that lasts for one request cycle
      render(:new)
    end
  end

  def show
    @song = Song.find(params[:id]) #params[:id] comes from the url
  end

  def edit
    @song = Song.find(params[:id])
  end

  private

  def song_params #use this when you get a ActiveModel::ForbiddenAttributesError
    params.require(:song).permit(:title, :artist)
  end
end


#you don't need to say erb: idex, rails knows where to go
# Song.create(params[:song]) have Morgan explain this to you....


# C -create method
# R -index method
# U -
# D
