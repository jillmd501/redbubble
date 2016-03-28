require 'pry'

class Work
  attr_reader :xml

  def initialize(xml)
    @xml = xml
  end

  def make
    binding.pry
    Nokogiri::XML(@xml).xpath("//work//exif//make")
  end

  def model
    Nokogiri::XML(@xml).xpath("//work//exif//model")
  end

  def thumbnail
    Nokogiri::XML(@xml).xpath("//work//urls//url type='small'")
  end

  def id
    Nokogiri::XML(@xml).xpath("//work//id")
  end

end
