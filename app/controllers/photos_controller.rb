class PhotosController < ApplicationController
  before_action :set_photo, only: [:edit, :update, :destroy]
before_action :authenticate_user!

  def index
  	@photos = Photo.all
  end

  def new
    if params[:back]
      @photo = Photo.new(photos_params)
    else
      @photo = Photo.new
    end
  end

  def create
   @photo = Photo.new(photos_params)
    if @photo.save
      redirect_to photos_path, notice: "写真を公開しました！"
    else
      render 'new'
    end
  end

  def edit
  end

  def update
    @photo.update(photos_params)
    if @photo.save
      redirect_to photos_path, notice: "写真を更新しました！"
    else
      render 'edit'
    end
  end

  def destroy
    @photo.destroy
    redirect_to photos_path, notice: "写真を削除しました！"
  end

    private
    def photos_params
      params.require(:photo).permit(:name, :image, :image_cache, :remove_image)
    end

    def set_photo
      @photo = Photo.find(params[:id])
    end

end
