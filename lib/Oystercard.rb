class Oystercard 
  
  attr_reader :balance

  MAX_BALANCE = 90

  def initialize
    @balance = 0
  end

  def top_up(money)
    fail "Max allowable balance is £#{MAX_BALANCE}" if @balance + money > MAX_BALANCE
    @balance += money
  end

end