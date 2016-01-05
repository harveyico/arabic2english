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

    it 'translate arabic number of 1_000-999_999 into english' do
      expect(arabic_to_english.translate!(165_321)).to eq 'one hundred sixty five thousand three hundred twenty one'
    end

    it 'translate arabic number of 1_000_000-999_999_999' do
      expect(arabic_to_english.translate!(500_100_000)).to eq 'five hundred million one hundred thousand'
    end

    context 'errors when' do
      it 'fails if the argument is not a number' do
        expect(arabic_to_english.translate!('test')).to eq 'test is not a valid number'
      end

      it 'fails if the argument is out of range'
    end

  end

end
