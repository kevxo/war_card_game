require './lib/turn'

class Game
  def self.prompt(player1, player2)
    p 'Welcome to War! (or Peace) This game will be played with 52 cards.'
    p "The Players today are: #{player1.name} and #{player2.name}."
    p "Type 'GO' to start the game!"
  end

  def self.display_current_result(turn, count, winner)
    if turn.type == :basic
      turn.award_spoils(winner)
      p "Turn #{count}: #{winner.name} won 2" if winner != 'No Winner'
    elsif turn.type == :war
      turn.award_spoils(winner)
      p "Turn #{count}: WAR - #{winner.name} won 6 cards" if winner != 'No Winner'
    else
      p '*mutually assured destruction* 6 cards removed from play'
    end
  end

  def self.game_plays(player1, player2, count)
    until player1.has_lost? || player2.has_lost?
      turn = Turn.new(player1, player2)
      winner = turn.winner
      turn.pile_cards

      display_current_result(turn, count, winner)
      break if count == 1_000_000

      count += 1
    end

    display_results(player1, player2, count)
  end

  def self.display_results(player1, player2, count)
    if player1.has_lost?
      p "*~*~*~* #{player2.name} has won the game! *~*~*~*"
    elsif player2.has_lost?
      p "*~*~*~* #{player1.name} has won the game! *~*~*~*"
    elsif count == 1_000_000
      p '---- DRAW ----'
    end
  end

  def self.start(player1, player2)
    prompt(player1, player2)
    user_input = gets.chomp

    p '-----------------------------------------------------------------------'
    if user_input == 'GO'
      count = 0
      game_plays(player1, player2, count)
    else
      start(player1, player2)
    end
  end
end
