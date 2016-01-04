class Arabic2English
  def temp_mapping
    {
      '1' => 'one',
      '2' => 'two',
      '3' => 'three',
      '4' => 'four',
      '5' => 'five',
    }
  end

  def translate!(num)
    temp_mapping[num.to_s]
  end
end

arabic_to_english = Arabic2English.new
ARGV.each do |num|
  puts arabic_to_english.translate!(num)
end