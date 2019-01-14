require_relative 'station'

class Oystercard
  attr_reader :balance, :entry_station, :journeys
  MAXIMUM_LIMIT = 90
  MINIMUM_FARE = 1

  def initialize
    @balance = 0
    @single_journey = {:entry_station => nil, :exit_station => nil}
    @journeys = []
  end

  def top_up(amount)
    raise "Balance has exceeded maximum limit of #{MAXIMUM_LIMIT}" if @balance + amount > MAXIMUM_LIMIT

    @balance += amount
  end


  def touch_in(entry_station)
    raise "Insufficient balance to touch in" if @balance < MINIMUM_FARE

    @single_journey[:entry_station] = entry_station
  end


  def touch_out(exit_station)
    deduct(MINIMUM_FARE)
    @single_journey[:exit_station] = exit_station
    add_to_journeys_list
    reset_entry_station
  end

  def in_journey?
    !!@single_journey[:entry_station]
  end

private
  def deduct(amount)
    @balance -= amount
  end

  def reset_entry_station
    @single_journey[:entry_station => nil]
  end

  def add_to_journeys_list
    @journeys << @single_journey.clone
  end

end
