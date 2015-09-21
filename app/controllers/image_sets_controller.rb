class ImageSetsController < ApplicationController
  def index
    @image_sets = current_user.image_sets.order(:created_at)
  end

  def new
    @image_set = ImageSet.new
    3.times { @image_set.images.build }
  end

  def create
    @image_set = current_user.image_sets.build(image_set_params)

    if @image_set.save
      flash[:success] = 'Images successfully uploaded'
      redirect_to image_sets_path
    else
      flash[:error] = @image_set.errors.full_messages.to_sentence
      redirect_to new_image_set_path
    end
  end

  def edit
    @image_set = ImageSet.find(params[:id])
  end

  private def image_set_params
    params.require(:image_set).permit(
      :name,
      :imaged_on,
      images_attributes: [:id, :file, :filter_id]
    )
  end
end
