class Oystercard
  attr_reader :balance, :in_journey
  MAXIMUM_LIMIT = 90
  MINIMUM_FARE = 1

  def initialize
    @balance = 0
    @in_journey = false
  end

  def top_up(amount)
    raise "Balance has exceeded maximum limit of #{MAXIMUM_LIMIT}" if @balance + amount > MAXIMUM_LIMIT

    @balance += amount
  end


  def touch_in
    raise "Insufficient balance to touch in" if @balance < MINIMUM_FARE

    @in_journey = true
  end

  def touch_out
    deduct(MINIMUM_FARE)
    @in_journey = false
  end

  def in_journey?
    @in_journey
  end

private
  def deduct(amount)
    @balance -= amount
  end

end
