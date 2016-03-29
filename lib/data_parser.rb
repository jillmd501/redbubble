require_relative 'index'
require_relative 'work'

require 'nokogiri'
require 'erb'
require 'pry'

class Parser
  attr_reader :filename, :works

  def initialize
    @filename = filename
    @works = []
  end

  def read_file(filename)
    File.open(filename) do |file|
      Nokogiri::XML(file).xpath("//work").each do |work|
        @works << Work.new(work)
      end
    end
    @works
  end

  def write_erb_file(filename, content)
    erb_str = File.read(erb_file)
    renderer = ERB.new(erb_str)
    result = renderer.result()

    File.open(html_file, 'w') do |f|
      f.write(result)
    end
  end

  def validate_params(filename)
    unless filename && File.exist?(filename)
      raise "File does not exist!"
    end
  end


end

parser = Parser.new
@works = parser.read_file("/Users/jilldonohue/redbubble/data/input/works.xml")
erb_file = './views/template/index.html.erb'
html_file = File.basename(erb_file, '.erb')

erb_str = File.read(erb_file)
renderer = ERB.new(erb_str)
result = renderer.result()

File.open(html_file, 'w') do |f|
  f.write(result)
end
