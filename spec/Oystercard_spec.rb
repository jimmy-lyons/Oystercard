require 'oystercard'

describe Oystercard do
  it 'New instances of Oystercard have a balance of zero' do
    expect(subject.balance).to eq(0) 
  end

  it 'Does not allow more than the max balance' do
    expect{ subject.top_up(Oystercard::MAX_BALANCE + 1) }.to raise_error "Max allowable balance is £#{Oystercard::MAX_BALANCE}"
  end

  describe '#top_up' do

    it 'adds topup value to balance' do
      expect{ subject.top_up 50 }.to change{ subject.balance }.by 50
    end

  end

end