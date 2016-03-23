class CameraModel
  attr_reader :name, :images

  def initialize(name)
    @name = name
    @images = {}
  end

  def add_image_without_duplicate(image)
    unless @images.has_key?(image.id)
      @images[image.id] = image
    end
  end
end
