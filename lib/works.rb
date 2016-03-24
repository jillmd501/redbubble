class Work
  def create_single_work
    works = Nokogiri::XML(filename).xpath("//work")
    single_work = works.each do
  end

  def make
    Nokogiri::XML(file).xpath("works//work//exif//make")
  end

  def model
    Nokogiri::XML(file).xpath("works//work//exif//models")
  end

  def thumbnail
    Nokogiri::XML(file).xpath("works//work//urls//small")
  end

  def id
    Nokogiri::XML(file).xpath("works//work//id")
  end

end
