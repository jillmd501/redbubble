class CameraImage

  attr_reader :thumbnails, :id

  def initialize(id, thumbnails)
    @id = id
    @thumbnails = thumbnails
  end

end
