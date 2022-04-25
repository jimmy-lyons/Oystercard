require 'oystercard'

describe Oystercard do
  it 'New instances of Oystercard have a balance of zero' do
    expect(subject.balance).to eq(0) 
  end
end