require 'rspec'
require './lib/deck'
require './lib/card'

RSpec.describe Deck do
  describe 'Deck Object' do
    let(:card1) { Card.new(:heart, 'Jack', 11) }
    let(:card2) { Card.new(:heart, 'King', 13) }
    let(:card3) { Card.new(:heart, 'Queen', 12) }
    let(:card4) { Card.new(:club, '4', 4) }
    let(:card5) { Card.new(:club, '6', 4) }

    let(:cards) { [card1, card2, card3, card4] }

    let(:deck) { Deck.new(cards) }
    it 'exits' do
      expect(deck).to be_a Deck
    end

    it 'should return rank of card' do
      expect(deck.rank_of_card_at(0)).to eq(11)
      expect(deck.rank_of_card_at(2)).to eq(12)
    end

    it 'should return an array of high value cards' do
      expect(deck.high_ranking_cards).to eq([card1, card2, card3])
    end

    it 'should return the percentage of high value cards' do
      expect(deck.percent_high_ranking_cards).to eq(75.0)
    end

    it 'should remove top card from deck' do
      expect(deck.remove_top_card).to eq(card1)
    end

    it 'should add card to the end of the deck' do
      deck.add_card(card5)
      expect(deck.cards).to eq([card1, card2, card3, card4, card5])
    end
  end
end
