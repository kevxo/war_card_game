require 'rspec'
require './lib/card'

RSpec.describe Card do
  describe 'Card Object' do
    let(:card) {Card.new(:heart, 'Jack', 11)}

    it 'exists' do
      expect(card).to be_a Card
    end

    it 'should return suit, value, rank' do
      expect(card.suit).to eq :heart
      expect(card.value).to eq 'Jack'
      expect(card.rank).to eq 11
    end
  end
end