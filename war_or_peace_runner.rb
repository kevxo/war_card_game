require './lib/card_generator'
require './lib/deck'
require './lib/player'
require_relative 'game.rb'


filename = 'cards.txt'

cards = CardGenerator.new(filename).cards

split_deck = cards.each_slice(26).to_a

deck1 = Deck.new(split_deck[0])
deck2 = Deck.new(split_deck[1])

player1 = Player.new('Kevin', deck1)
player2 = Player.new('Liam', deck2)

Game.start(player1, player2)
