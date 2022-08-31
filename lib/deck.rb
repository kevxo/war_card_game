class Deck
  attr_reader :cards

  def initialize(cards)
    @cards = cards
  end

  def rank_of_card_at(index)
    if index >= @cards.length
      nil
    else
      @cards[index].rank
    end
  end

  def high_ranking_cards
    high_cards = []
    face_cards = %w[Jack King Queen Ace]

    @cards.each do |card|
      high_cards << card if card.rank >= 11 && face_cards.include?(card.value)
    end

    high_cards
  end

  def percent_high_ranking_cards
    (high_ranking_cards.length.to_f / @cards.length) * 100
  end

  def remove_top_card
    @cards.shift
  end

  def add_card(card)
    @cards << card
  end
end
