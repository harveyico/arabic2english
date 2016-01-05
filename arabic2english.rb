require 'yaml'

class Arabic2English
  attr_accessor :mapping

  def initialize
    self.mapping ||= YAML.load_file(File.join(__dir__, 'word_mapping.yml'))
  end

  def translate!(i)
    i = Integer i rescue return "#{i} is not a valid number"

    write_word(i)
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
end

arabic_to_english = Arabic2English.new
ARGV.each do |num|
  puts arabic_to_english.translate!(num)
end