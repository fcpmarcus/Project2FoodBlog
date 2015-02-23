class PhotosController < ApplicationController
  def index
    @photos = Photo.all
  end
  def new
  	@post = Post.where(id: params[:post_id]).first
    @photo = @post.photos.new
  end
  def create
  	post = Post.where(id: params[:post_id]).first
    # Find our user that we should attach to
    photo = current_user.photos.new(photo_params)
    #or the standard create:
    # @photo = Photo.create(photo_params)
    if photo.save
      redirect_to photos_path
    else
      render 'new'
    end
  end

  def show

  end

  def photo_params
    params.require(:photo).permit(:image)
  end
end