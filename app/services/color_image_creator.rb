class ColorImageCreator
  attr_reader :image

  def initialize(image_set)
    @image_set = image_set
    @errors = []
  end

  def create
    return false unless valid?

    system("mkdir -p #{base_directory}")
    system("convert #{red_image.filepath} #{green_image.filepath} #{blue_image.filepath} -channel RGB -combine -despeckle -enhance -noise 0 #{temp_file}")

    @image = ColorImage.new(file: File.open(temp_file), image_set: @image_set)
    @image.save || @errors << @image.errors.full_messages.to_sentence

    @errors.empty?
  end

  def errors
    @errors.join ' '
  end

  private def valid?
    unless [red_image, green_image, blue_image].all?(&:present?)
      @errors << 'Must have a red, green and blue image to create a color image.'
    end

    @errors.empty?
  end

  private def red_image
    @red_image ||= @image_set.red_image
  end

  private def green_image
    @green_image ||= @image_set.green_image
  end

  private def blue_image
    @blue_image ||= @image_set.blue_image
  end

  private def full_path
    "#{base_directory}#{image_set_directory}#{color_image_filename}"
  end

  private def base_directory
    Rails.root.join('tmp/color_images/')
  end

  private def temp_file
    @temp_file ||= "#{base_directory}color_image#{Time.zone.now.to_i}.jpg"
  end
end
