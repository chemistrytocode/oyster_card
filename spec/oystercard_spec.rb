require 'oystercard'

describe Oystercard do

  describe '#balance' do

    it 'Should initialize a Oystercard object with a default balance of 0' do
      expect(subject.balance).to eq 0
    end

    it 'Should increment the balance by a number when top_up is called' do
      subject.top_up(10)
      expect(subject.balance).to eq 10
    end

    it 'should throw an error if balance exceeds maximum limit' do
      error = "Balance has exceeded maximum limit of #{Oystercard::MAXIMUM_LIMIT}"
      subject.top_up(Oystercard::MAXIMUM_LIMIT)
      expect { subject.top_up(1) }.to raise_error(error)
    end

    # it 'should deduct an amount from the balance' do
    #   subject.top_up(20)
    #   subject.deduct(10)
    #   expect(subject.balance).to eq 10
    # end

    it 'should throw if balance is less than minimum journey amount' do
      error = "Insufficient balance to touch in"
      expect { subject.touch_in }.to raise_error(error)
    end

    it 'should deduct balance on check_out' do
      subject.top_up(5)
      expect{ subject.touch_out }.to change { subject.balance }.by (-Oystercard::MINIMUM_FARE)
    end
  end

  describe '#in_journey?' do

    it 'should set in_journey? to true when touch_in is called' do
      subject.top_up(5)
      subject.touch_in
      expect(subject).to be_in_journey
    end

    it 'should set in_journey? to false when touch_out is called' do
      subject.touch_out
      expect(subject).not_to be_in_journey
    end

    it 'should return true if in_use is true' do
      subject.top_up(5)
      subject.touch_in
      expect(subject.in_journey?).to eq true
    end

  end

end
