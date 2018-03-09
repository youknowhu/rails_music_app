class AlbumsController < ApplicationController
# resources :albums, only: [:create, :edit, :show, :update, :destroy]
before_action :require_logged_in

  def new
    @album = Album.new
    @bands = Band.all
    render :new
  end

  def create
    @album = Album.new(albums_params)
    @bands = Band.all
    if @album.save
      redirect_to bands_url(@band)
    else
      flash[:errors] = ["Invalid album entry"]
      render :new
    end
  end

  def edit
    @album = Album.find(params[:id])
    @bands = Band.all
    render :edit
  end

  def show
    @album = Album.find(params[:id])
    @band = Band.find(@album.band_id)
    render :show
  end

  def update
    @album = Album.find(params[:id])
    @bands = Band.all
    @band = Band.find(@album.band_id)

    if @album.update(albums_params)
      redirect_to bands_url(@band)
    else
      flash[:errors] = ["Invalid update"]
      render :edit
    end
  end

  def destroy
    @album = Album.find(params[:id])
    @album.destroy
    render :show
  end

  private
  def albums_params
    params.require(:album).permit(:band_id, :title, :year, :location)
  end

end
