require 'nokogiri'
require 'erb'

class Parser
  attr_reader :filename

  def initialize
    @filename = filename
  end

  def create
    works = Work.from_xml(@filename)
  end


  def read_file
    File.open(filename) do |file|
      Nokogiri::XML(file).xpath("//work")
    end
  end

  def write_file(filename, content)
    File.open(filename, 'w') { |file| file.write(content) }
  end

  def html(title, nav_links, works)
    works = works.first(10)
    ERB.new(File.read(File.join("template", "index.html.erb"))).result(binding)
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
