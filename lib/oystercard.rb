class Oystercard
  attr_reader :balance, :entry_station
  MAXIMUM_LIMIT = 90
  MINIMUM_FARE = 1

  def initialize
    @balance = 0
    @entry_station = nil
  end

  def top_up(amount)
    raise "Balance has exceeded maximum limit of #{MAXIMUM_LIMIT}" if @balance + amount > MAXIMUM_LIMIT

    @balance += amount
  end


  def touch_in(station)
    raise "Insufficient balance to touch in" if @balance < MINIMUM_FARE

    @entry_station = station
  end

  def touch_out
    deduct(MINIMUM_FARE)
    @entry_station = nil
  end

  def in_journey?
    !!entry_station
  end

private
  def deduct(amount)
    @balance -= amount
  end

end
