require 'rspec'
require './lib/card'
require './lib/deck'
require './lib/player'

RSpec.describe Player do
  describe 'Player Object' do
    let(:card1) { Card.new(:diamond, 'Queen', 12) }
    let(:card2) { Card.new(:spade, '3', 3) }
    let(:card3) { Card.new(:heart, 'Ace', 14) }

    let(:deck) {Deck.new([card1, card2, card3])}

    let(:player) {Player.new('Clarisa', deck)}

    it 'exists' do
      expect(player).to be_a Player
    end

    it 'should return player name and deck' do
      expect(player.name).to eq 'Clarisa'
      expect(player.deck).to eq deck
    end

    it 'should return a boolean if player has lost' do
      expect(player.has_lost?).to eq false

      player.deck.remove_top_card

      expect(player.has_lost?).to eq false

      player.deck.remove_top_card

      expect(player.has_lost?).to eq false

      player.deck.remove_top_card

      expect(player.has_lost?).to eq true
      expect(player.deck.cards).to eq deck.cards
    end
  end
end