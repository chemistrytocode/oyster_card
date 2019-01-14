require 'oystercard'

describe Oystercard do

  describe '#New' do
    it "Should initialize a Oystercard object with a default balance of 0" do
    expect(subject.balance).to eq 0
    end
  end

end
