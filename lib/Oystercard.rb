class Oystercard 
  
  attr_reader :balance

  MAX_BALANCE = 90
  TRAVEL_MINIMUM = 1
  MIN_FARE = 1

  def initialize
    @balance = 0
    @in_journey = false
  end

  def top_up(money)
    fail "Max allowable balance is £#{MAX_BALANCE}" if @balance + money > MAX_BALANCE
    @balance += money
  end

  def in_journey?
    @in_journey
  end

  def touch_in
    fail "Insufficient balance" if @balance < TRAVEL_MINIMUM
    @in_journey = true
  end

  def touch_out
    @in_journey = false
    deduct(MIN_FARE)
  end

  private

  def deduct(money)
    @balance -= money
  end

end