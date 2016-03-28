require_relative 'index'
require_relative 'work'

require 'nokogiri'

class Parser
  attr_reader :filename, :works

  def initialize
    @filename = filename
    @works = []
  end

  def read_file(filename)
    File.open(filename) do |file|
      Nokogiri::XML(file).xpath("//work").each do |work|
      @works <<  Work.new(work)
      end
    end
  end

  def write_file(filename, content)
    File.open(filename, 'w') { |file| file.write(content) }
  end

  def html(title, nav_links, works)
    works = works.first(10)
    ERB.new(File.read(File.join("template", "index.html"))).result(binding)
  end

private

  def validate_params(filename, output_path)
    unless filename && File.exist?(filename)
      raise "File does not exist!"
    end
    unless output_path && File.directory?(output_path)
      raise "Output does not exist!"
    end
  end


end

parser = Parser.new
parser.read_file("/Users/jilldonohue/redbubble/data/input/works.xml")
puts parser.works[0].make
