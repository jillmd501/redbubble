require 'nokogiri'

class Parser
  attr_reader :filename

  def initialize
    @filename = filename
  end

  def read_data
    File.open(filename) do |file|
      Nokogiri::XML(file).xpath("//work")
    end
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
