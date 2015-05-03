class ArtistsController < ApplicationController
  def new
    @artist = Artist.new
  end

  def create
    @artist = Artist.new(artist_params)

    if @artist.save
      flash[:notice] = "Your artist has been added."
      redirect_to root_path
    else
      render :new
    end
  end

  def show
    @artist = Artist.find_by_id(params[:id])
  end

  private

  def artist_params
    params.require(:artist).permit(:name, :dates)
  end
end