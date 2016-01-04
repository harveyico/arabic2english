class Arabic2English
  def base_numbers
    {
      100 => 'hundred',
      90 => 'ninety',
      80 => 'eighty',
      70 => 'seventy',
      60 => 'sixty',
      50 => 'fifty',
      40 => 'fourty',
      30 => 'thiry',
      20 => 'twenty',
      19 => 'nineteen',
      18 => 'eighteen',
      17 => 'seventeen',
      16 => 'sixteen',
      15 => 'fifteen',
      14 => 'fourteen',
      13 => 'thirteen',
      12 => 'twelve',
      11 => 'eleven',
      10 => 'ten',
      9 => 'nine',
      8 => 'eight',
      7 => 'seven',
      6 => 'six',
      5 => 'five',
      4 => 'four',
      3 => 'three',
      2 => 'two',
      1 => 'one'
    }
  end


  def translate!(integer)
    integer = integer.to_i
    result = String.new

    base_numbers.each do |num, text|
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