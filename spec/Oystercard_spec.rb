require 'oystercard'

describe Oystercard do
  it 'New instances of Oystercard have a balance of zero' do
    expect(subject.balance).to eq(0) 
  end

  describe '#top_up' do

    it 'adds topup value to balance' do
      expect{ subject.top_up 100 }.to change{ subject.balance }.by 100
    end

  end

end