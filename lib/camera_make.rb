 require_relative 'camera_model'

class CameraMake
  attr_reader :name, :models, :images

  # empty array for models to shovel in new models if they do not exist yet
  # has of images with key/value pairs

  def initialize(name)
    @name = name
    @models = []
    @images = {}
  end
end
