class ColorImagesController < ApplicationController
  def show
    @color_image = ColorImage.find(params[:id])
  end

  def create
    image_set = ImageSet.find(params[:image_set_id])
    creator = ColorImageCreator.new(image_set)

    if creator.create
      flash[:success] = 'Images successfully combined'
      redirect_to creator.image
    else
      flash[:error] = creator.errors
      redirect_to image_sets_path
    end
  end
end
