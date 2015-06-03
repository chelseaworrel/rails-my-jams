class SongsController < ApplicationController

  before_action(:set_song, only: [:show, :edit, :update, :destroy]) #set_song method is defined in private methods below

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
    #this and edit are empty because what lives inside them is: @song = Song.find(params[:id])
    #which is defined in the before_action and the set_song priate method
  end

  def edit
  end

  def update
    if @song.update(song_params)
      redirect_to song_path(@song) #this can just be: redirect_to @song
    else
      render :edit
    end
  end

  def destroy
    @song.destroy
    redirect_to(songs_path)
  end

  private

  def song_params #use this when you get a ActiveModel::ForbiddenAttributesError
    params.require(:song).permit(:title, :artist)
  end

  def set_song
    @song = Song.find(params[:id]) #params[:id] comes from the url
  end
end


#you don't need to say erb: idex, rails knows where to go
# Song.create(params[:song]) have Morgan explain this to you....


# C -create method
# R -index method
# U - need edit + update method
# D - destroy method
