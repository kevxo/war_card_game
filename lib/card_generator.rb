require_relative 'card'

class CardGenerator
  def initialize(filename)
    @filename = filename
  end

  def cards
    cards = []

    File.open(@filename, 'r') do |f|
      f.each_line do |line|
        line = line.chop.split(', ')
        cards << Card.new(line[1], line[0], line[2].to_i)
      end
    end

    cards.shuffle
  end
end
