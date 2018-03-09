class TracksController < ApplicationController
# resources :albums, only: [:create, :edit, :show, :update, :destroy]
  before_action :require_logged_in
  def show
    @track = Track.find(params[:id])
    render :show
  end

  def new
    @album = Album.find(params[:album_id])
    @track = Track.new(album_id: params[:album_id])
    render :new
  end

  def create
    @track = Track.new(track_params)

    if @track.save
      redirect_to track_url(@track)
    else
      @album = @track.album
      flash.now[:errors] = @track.errors.full_messages
      render :new
    end
  end

  def edit
    @track = Track.find(params[:id])
    render :edit
  end

  def update
    @track = Track.find(params[:id])

    if @track.update(track_params)
      redirect_to track_url(@track)
    else
      flash.now[:errors] = @track.errors.full_messages
      render :edit
    end
  end

  def destroy
    @track = Track.find(params[:id])
    @track.destroy
    redirect_to album_url(@track.album_id)
  end

  private
  def track_params
    params.require(:track).permit(:album_id, :track_type, :lyrics, :title, :ord)
  end

end
