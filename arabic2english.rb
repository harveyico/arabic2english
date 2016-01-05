require 'yaml'

class Arabic2English
  attr_accessor :mapping, :maximum_range

  def initialize
    yaml= YAML.load_file(File.join(__dir__, 'word_mapping.yml'))
    self.mapping ||= yaml['numbers']
    self.maximum_range ||= yaml['settings']['maximum_range']
  end

  def translate!(i)
    i = Integer i rescue return "#{i} is not a valid number"

    if in_range(i)
      write_word(i)
    else
      "#{i} is out of range"
    end
  end

private
  def write_word(i)
    result = String.new
    mapping.each do |num, text|
      if i.to_s.length == 1 && i/num > 0
        return result + text # 1-9
      elsif i < 100 && i/num > 0
        return result + text if i%num == 0 # 10-20
        return "#{result}#{text} #{translate!(i%num)}"
      elsif i/num > 0
        result = "#{result}#{translate!(i/num)} #{text}" # 100-so on..
        result += " #{translate!(i%num)}" if i%num > 0
        return result
      end
    end
  end

  def in_range(i)
    i <= maximum_range
  end
end

arabic_to_english = Arabic2English.new
ARGV.each do |num|
  puts arabic_to_english.translate!(num)
end