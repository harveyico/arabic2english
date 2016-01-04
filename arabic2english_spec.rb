require './arabic2english.rb'

describe Arabic2English do

  let!(:arabic_to_english) { Arabic2English.new }

  describe '#translate!' do
    it 'translates common arabic number into english' do
      expect(arabic_to_english.translate!(1)).to eq 'one'
    end

    it 'translate arabic number of tenths into english' do
      expect(arabic_to_english.translate!(11)).to eq 'eleven'
    end

    it 'translate arabic number of tenths above into english' do
      expect(arabic_to_english.translate!(41)).to eq 'twenty one'
    end
  end

end
