class Index

  def make(file)
    Nokogiri::XML(file).xpath("works//work//exif//make")
  end

  def model(file)
    Nokogiri::XML(file).xpath("works//work//exif//models")
  end

  def thumbnail(file)
    Nokogiri::XML(file).xpath("works//work//urls//small")
  end

  def id(file)
    Nokogiri::XML(file).xpath("works//work//id")
  end

end
