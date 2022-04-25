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

  # REMOVED - test redundant because it is covered by 'deducts fare from card balance'
  # describe '#deduct' do

  #   it 'deducts money from the card' do
  #     subject.top_up(20)
  #     expect{ subject.deduct 5 }.to change{ subject.balance }.by -5
  #   end

  # end

  describe '#in_journey?' do

    it 'card is not in journey when initialised' do
      expect(subject).not_to be_in_journey
    end

  end

  describe '#touch_in' do

    it 'changes card state to "in journey"' do
      subject.top_up(Oystercard::TRAVEL_MINIMUM)
      subject.touch_in
      expect(subject).to be_in_journey
    end

    it "doesn't allow you to touch in if balance is less than £1" do
      expect{ subject.touch_in }.to raise_error "Insufficient balance"
    end

  end

  describe '#touch_out' do

    it 'changes card state in_journey to false' do
      subject.top_up(Oystercard::TRAVEL_MINIMUM)
      subject.touch_in
      subject.touch_out
      expect(subject).not_to be_in_journey
    end

    it 'deducts fare from card balance' do
      subject.top_up(Oystercard::TRAVEL_MINIMUM)
      subject.touch_in
      
      expect{ subject.touch_out }.to change{ subject.balance }.by(-Oystercard::MIN_FARE)
    end

  end

end