class PhotosController < ApplicationController
  before_action :set_photo, only: [:show, :edit, :update, :destroy]
  respond_to :html

  def index
    @photos = Photo.all
    @babies = Baby.all
    respond_with(@photos)
  end

  def show
    respond_with(@photo)
  end

  def new
    @photo = Photo.new
    respond_with(@photo)
  end

  def edit
  end

  def create
    @photo = Photo.new(photo_params)
    @photo.date_taken = Date.current
    @photo.baby = current_user.babies.find(photo_params[:baby_id])
    @photo.save
    redirect_to timeline_baby_url(@photo.baby_id)
  end

  def update
    @photo.update(photo_params)
    respond_with(@photo)
  end

  def destroy
    @photo.destroy
    respond_with(@photo)
  end

  private
    def set_photo
      @photo = photo.find(params[:id])
    end

    def photo_params
      params.require(:photo).permit(:image, :caption, :date_taken, :baby_id)
    end

end
