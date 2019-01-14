require 'oystercard'

describe Oystercard do

  describe '#balance' do

    it "Should initialize a Oystercard object with a default balance of 0" do
    expect(subject.balance).to eq 0
    end

    it "should increment the balance by a number when top_up is called" do
    subject.top_up(10)
    expect(subject.balance).to eq 10
    end

  end

end
