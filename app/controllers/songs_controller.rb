class SongsController < ApplicationController
  def index
    @songs = Song.all
  end
end


#you don't need to say erb: idex, rails knows where to go 
