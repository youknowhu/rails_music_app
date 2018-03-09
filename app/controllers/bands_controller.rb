class BandsController < ApplicationController
  before_action :require_logged_in

  def index
    @bands = Band.all.order(:id)
    render :index
  end

  def new
    @band = Band.new
    render :new
  end

  def create
    @band = Band.new(bands_params)

    if @band.save
      redirect_to bands_url
    else
      flash[:errors] = ["Invalid band entry"]
      render :new
    end
  end

  def edit
    @band = Band.find(params[:id])
    render :edit
  end

  def show
    @band = Band.find(params[:id])
    @albums = @band.albums
    render :show
  end

  def update
    @band = Band.find(params[:id])

    if @band.update(bands_params)
      redirect_to bands_url
    else
      flash[:errors] = ["Invalid update"]
      render :edit
    end
  end

  def destroy
    @band = Band.find(params[:id])
    @band.destroy
    render :show
  end

  private
  def bands_params
    params.require(:band).permit(:name)
  end
end
