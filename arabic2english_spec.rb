require './arabic2english.rb'

describe Arabic2English do

  let!(:arabic_to_english) { Arabic2English.new }

  describe '#translate!' do
    it 'translates arabic number of 1-10 into english' do
      expect(arabic_to_english.translate!(9)).to eq 'nine'
    end

    it 'translate arabic number of 11-19 into english' do
      expect(arabic_to_english.translate!(11)).to eq 'eleven'
    end

    it 'translate arabic number of 20-99 into english' do
      expect(arabic_to_english.translate!(51)).to eq 'fifty one'
    end

    it 'translate arabic number of 100-999 into english' do
      expect(arabic_to_english.translate!(171)).to eq 'one hundred seventy one'
    end

  end

end
