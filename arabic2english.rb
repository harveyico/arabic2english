require 'yaml'

class Arabic2English
  attr_accessor :mapping

  def initialize
    self.mapping ||= YAML.load_file(File.join(__dir__, 'word_mapping.yml'))
  end

  def translate!(integer)
    integer = integer.to_i
    result = String.new

    mapping.each do |num, text|
      if integer.to_s.length == 1 && integer/num > 0
        return result + text
      elsif integer < 100 && integer/num > 0
        return result + text if integer%num == 0
        return result + text + ' ' + translate!(integer%num)
      elsif integer/num > 0
        return result + translate!(integer/num) + ' ' + text + ' ' + translate!(integer%num)
      end
    end
  end
end

arabic_to_english = Arabic2English.new
ARGV.each do |num|
  puts arabic_to_english.translate!(num)
end