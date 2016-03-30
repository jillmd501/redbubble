require_relative 'index'
require_relative 'work'

require 'nokogiri'
require 'erb'

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
    @content = content
    File.open(File.basename(filename, '.erb'), 'w') do |f|
      f.write(ERB.new(File.read(filename)).result())
    end
  end

  def validate_params(filename)
    unless filename && File.exist?(filename)
      raise "File does not exist!"
    end
  end
end


@content = Parser.new.read_file("/Users/jilldonohue/redbubble/data/input/works.xml")
filename = './views/template/index.html.erb'
File.open(File.basename(filename, '.erb'), 'w') do |f|
  f.write(ERB.new(File.read(filename)).result())
end

# For model generation

# @model_data = Parser.new.read_file("/Users/jilldonohue/redbubble/data/input/works.xml")
# filename = './views/template/model.html.erb'
# @model_data.each do |data|
#   @content = data
#   File.open(File.basename(filename, '.erb'), 'w') do |f|
#     f.write(ERB.new(File.read(filename)).result())
#   end
# end


# For make generation
# @make_data = Parser.new.read_file("/Users/jilldonohue/redbubble/data/input/works.xml")
# filename = './views/template/model.html.erb'
# @model_data.each do |data|
#   @content = data
#   File.open(File.basename(filename, '.erb'), 'w') do |f|
#     f.write(ERB.new(File.read(filename)).result())
#   end
# end
