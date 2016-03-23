class CameraMake
  attr_reader :name, :models, :images

  def initialize(name)
    @name = name
    @models = []
    @images = {}
  end
end
