require 'rspec'
require './lib/card'
require './lib/deck'
require './lib/player'
require './lib/turn'

RSpec.describe Turn do
  describe 'Turn Object' do
    let(:card1) { Card.new(:diamond, 'Queen', 12) }
    let(:card2) { Card.new(:spade, '3', 3) }
    let(:card3) { Card.new(:heart, 'Ace', 9) }
    let(:card4) { Card.new(:diamond, 'Jack', 11) }
    let(:card5) { Card.new(:heart, '8', 8) }
    let(:card6) { Card.new(:diamond, 'Queen', 12) }
    let(:card7) { Card.new(:heart, '3', 3) }
    let(:card8) { Card.new(:diamond, '2', 2) }

    let(:deck) { Deck.new([card1, card2, card5, card8]) }
    let(:deck2) { Deck.new([card3, card4, card6, card7]) }

    let(:player1) { Player.new('Meagan', deck) }
    let(:player2) { Player.new('Aurora', deck2) }

    let(:turn) { Turn.new(player1, player2) }

    it 'exists' do
      expect(turn).to be_a Turn
    end

    it 'returns the players and spoils of war' do
      expect(turn.player1).to eq(player1)
      expect(turn.player2).to eq(player2)
      expect(turn.spoils_of_war).to eq([])
    end

    it 'returns the turn type' do
      expect(turn.type).to eq :basic
    end

    it 'should determine the winner' do
      expect(turn.winner).to eq(player1)
    end

    it 'should return spoils_of_war' do
      turn.pile_cards

      expect(turn.spoils_of_war).to eq([card1, card3])
    end

    it 'should award winner with cards' do
      winner = turn.winner

      turn.pile_cards
      turn.award_spoils(winner)

      expect(player1.deck.cards.length).to eq(5)
      expect(player2.deck.cards.length).to eq(3)
    end
  end
end
