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

  def write_file(filename, content)
    File.open(filename, 'w') do |file|
      file.write(content)
    end
  end

  def create_content
    erb_str = Parser.read_file(@works)
    renderer = ERB.new(erb_str)
    content = renderer.content()
  #   ERB.new(File.read(File.join("template", "index.html"))).result(binding)
  end

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
@works = parser.read_file("/Users/jilldonohue/redbubble/data/input/works.xml")
erb_file = './views/template/make.html.erb'
html_file = File.basename(erb_file, '.erb')

erb_str = File.read(erb_file)
renderer = ERB.new(erb_str)
result = renderer.result()

File.open(html_file, 'w') do |f|
  f.write(result)
end
