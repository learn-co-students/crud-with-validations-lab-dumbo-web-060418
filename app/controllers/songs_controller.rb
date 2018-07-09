class SongsController < ApplicationController

  def index
   	@songs = Song.all
  end

  def new
    @song = Song.new
  end
 #check if params are valid, then save
 #if valid redirect to show page for created song
 #else re-render the new form, ending song instance lifecycle
  def create
    @song = Song.new(song_params)
    if @song.valid?
      @song.save
      redirect_to song_path(@song)
    else
      render :new
    end
  end

  def show
    @song = Song.find(params[:id])
  end

  def edit
    @song = Song.find(params[:id])
  end

  def update
    @song = Song.find(params[:id])
    @song.update(song_params)
		
    if @song.save
      redirect_to song_path(@song)
    else
      render :edit
    end
  end
	#pull song to destroy and redirect user to index page,  song(s)_path
  def destroy
    @song = Song.find(params[:id])
    @song.destroy
    redirect_to songs_path
  end

  def song_params
    params.require(:song).permit(:title, :artist_name, :genre, :release_year, :released)
  end
end
