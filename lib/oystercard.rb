class Oystercard
  attr_reader :balance
  MAXIMUM_LIMIT = 90

  def initialize
    @balance = 0
  end

  def top_up(amount)
    raise "Balance has exceeded maximum limit of #{MAXIMUM_LIMIT}" if @balance + amount > MAXIMUM_LIMIT

    @balance += amount
  end

  #allows to have a negative balance
  def deduct(amount)
    @balance -= amount
  end

end
