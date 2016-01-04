class Arabic2English
  def base_numbers
    {
      1 => 'one',
      2 => 'two',
      3 => 'three',
      4 => 'four',
      5 => 'five',
      6 => 'six',
      7 => 'seven',
      8 => 'eight',
      9 => 'nine',
      10 => 'ten',
      11 => 'eleven',
      12 => 'twelve',
      13 => 'thirteen',
      14 => 'fourteen',
      15 => 'fifteen',
      16 => 'sixteen',
      17 => 'seventeen',
      18 => 'eighteen',
      19 => 'nineteen',
      20 => 'twenty',
      30 => 'thiry',
      40 => 'fourty',
      50 => 'fifty',
      60 => 'sixty',
      70 => 'seventy',
      80 => 'eighty',
      90 => 'ninety'
    }
  end


  def translate!(integer)
    integer = integer.to_i
    result = String.new

    base_numbers.each do |num, text|
      if integer.to_s.length == 1 && integer/num > 0
        result += "#{text}"
      end
    end

    result
  end
end

arabic_to_english = Arabic2English.new
ARGV.each do |num|
  puts arabic_to_english.translate!(num)
end