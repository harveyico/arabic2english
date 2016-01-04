class Arabic2English
  def whole_numbers
    {
      0 => 'zero',
      1 => 'one',
      2 => 'two',
      3 => 'three',
      4 => 'four',
      5 => 'five',
      6 => 'six',
      7 => 'seven',
      8 => 'eight',
      9 => 'nine',
      10 => 'ten'
    }
  end

  def tenth_numbers
    {
      11 => 'eleven',
      12 => 'twelve',
      13 => 'thirteen',
      14 => 'fourteen',
      15 => 'fifteen',
      16 => 'sixteen',
      17 => 'seventeen',
      18 => 'eighteen',
      19 => 'nineteen'
    }
  end

  def translate!(num)
    num = num.to_i

    if num <= 10
      whole_numbers[num]
    elsif num > 10 && num < 20
      tenth_numbers[num]
    end
  end
end

arabic_to_english = Arabic2English.new
ARGV.each do |num|
  puts arabic_to_english.translate!(num)
end