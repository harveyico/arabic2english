require './arabic2english.rb'

describe Arabic2English do

  let!(:arabic_to_english) { Arabic2English.new }

  describe '#translate!' do
    it 'translates arabic number of 1-10 into english' do
      expect(arabic_to_english.translate!(9)).to eq 'nine'
    end

    it 'translate arabic number of greater than 10' do
      expect(arabic_to_english.translate!(11)).to eq 'eleven'
    end

    it 'translate arabic number of greather than 19 and less than 100' do
      expect(arabic_to_english.translate!(51)).to eq 'fifty one'
    end


  end

end
