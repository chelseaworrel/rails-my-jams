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
      #do something
    else
      #do something
    end
  end

  private
  
  def song_params #use this when you get a ActiveModel::ForbiddenAttributesError
    params.require(:song).permit(:title, :artist)
  end
end


#you don't need to say erb: idex, rails knows where to go
# Song.create(params[:song]) have Morgan explain this to you....
