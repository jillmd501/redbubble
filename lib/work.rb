require 'pry'

class Work
  attr_reader :xml

  def initialize(xml)
    @xml = xml
  end

  def make
    @xml.xpath("//work//exif//make")
  end

  def model
    @xml.xpath("//work//exif//model")
  end

  def thumbnail
    @xml.xpath("//work//urls").first.children[1].children.text
  end

  def filename
    @xml.xpath("//work//filename")
  end

  def id
    @xml.xpath("//work//id")
  end

end
