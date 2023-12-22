# frozen_string_literal: true

module Day4Part1
  def self.solution(lines)
    cards = lines.map { |line| Card.parse_line(line) }
    cards.sum { |card| card.points }
  end

  private

  Card = Struct.new(:winning_numbers, :actual_numbers, :keyword_init => true) do
    def self.parse_line(line)
      _, winning_numbers, actual_numbers = line.strip.split(/[:\|]/)

      Card.new(
        :winning_numbers => winning_numbers.strip.split.map(&:to_i),
        :actual_numbers => actual_numbers.strip.split.map(&:to_i)
      )
    end

    def points
      num_matches = winning_numbers.intersection(actual_numbers).length
      return 0 if num_matches == 0

      2**(num_matches - 1)
    end
  end
end
