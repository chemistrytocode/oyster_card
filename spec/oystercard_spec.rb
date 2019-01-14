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

    it 'should deduct an amount from the balance' do
      subject.top_up(20)
      subject.deduct(10)
      expect(subject.balance).to eq 10
    end

  end
end
