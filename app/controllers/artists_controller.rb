class ArtistsController < ApplicationController

  def index
    @artists = Artist.all
  end

  def edit
    @artist = Artist.find(params[:id])
  end

  def new
    @artist = Artist.new
  end

  def create
    @artist = Artist.new(artist_params(:name, :bio))
    if @artist.save
      redirect_to artist_path(@artist)
    else
      render :new
    end
  end

  def update
    @artist = Artist.find(params[:id])
    @artist.update(artist_params(:name, :bio))
    if @artist.save
      redirect_to artist_path(@artist)
    else
      render :new
    end
  end

  def show
    @artist = Artist.find(params[:id])
  end

  private

  def artist_params(*args)
    params.require(:artist).permit(*args)
  end

end