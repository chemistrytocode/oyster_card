class Oystercard
  attr_reader :balance, :in_journey
  MAXIMUM_LIMIT = 90

  def initialize
    @balance = 0
    @in_journey = false
  end

  def top_up(amount)
    raise "Balance has exceeded maximum limit of #{MAXIMUM_LIMIT}" if @balance + amount > MAXIMUM_LIMIT

    @balance += amount
  end

  #allows to have a negative balance
  def deduct(amount)
    @balance -= amount
  end

  def touch_in
    @in_journey = true
  end

  def touch_out
    @in_journey = false
  end

  def in_journey?
    in_journey
  end

end
