class Turn
  attr_reader :player1, :player2, :spoils_of_war

  def initialize(player1, player2)
    @player1 = player1
    @player2 = player2
    @spoils_of_war = []
  end

  def type
    if @player1.deck.rank_of_card_at(0) == @player2.deck.rank_of_card_at(0) && @player1.deck.rank_of_card_at(2) == @player2.deck.rank_of_card_at(2)
      :mutually_assured_destruction
    elsif @player1.deck.rank_of_card_at(0) != @player2.deck.rank_of_card_at(0)
      :basic
    elsif @player1.deck.rank_of_card_at(0) == @player2.deck.rank_of_card_at(0)
      :war
    end
  end

  def winner_for_basic
    if @player1.deck.rank_of_card_at(0) > @player2.deck.rank_of_card_at(0)
      @player1
    elsif @player1.deck.rank_of_card_at(0) < @player2.deck.rank_of_card_at(0)
      @player2
    else
      p 'No Winner'
    end
  end

  def winner_for_war
    if @player1.deck.rank_of_card_at(2) > @player2.deck.rank_of_card_at(2)
      @player1
    elsif @player1.deck.rank_of_card_at(2) < @player2.deck.rank_of_card_at(2)
      @player2
    else
      p 'No Winner'
    end
  end

  def winner
    # require 'pry' ; binding.pry
    if type == :mutually_assured_destruction
      p 'No Winner'
    elsif type == :basic
      winner_for_basic
    elsif type == :war
      winner_for_war
    end
  end

  def remove_three_cards(player)
    player.deck.remove_top_card
    player.deck.remove_top_card
    player.deck.remove_top_card
  end

  def remove_one_card(player)
    @spoils_of_war << player.deck.remove_top_card
  end

  def top_three_cards_to_spoils_of_war(player)
    @spoils_of_war << player.deck.remove_top_card
    @spoils_of_war << player.deck.remove_top_card
    @spoils_of_war << player.deck.remove_top_card
  end

  def pile_cards
    if type == :mutually_assured_destruction
      remove_three_cards(@player1)
      remove_three_cards(@player2)
    elsif type == :basic
      remove_one_card(@player1)
      remove_one_card(@player2)
    elsif type == :war
      top_three_cards_to_spoils_of_war(@player1)
      top_three_cards_to_spoils_of_war(@player2)
    end
  end

  def award_spoils(winner)
    @spoils_of_war.each do |card|
      winner.deck.add_card(card)
    end
  end
end
