# frozen_string_literal: true

module Day4Part2
  def self.solution(lines)
    cards = lines.map { |line| Card.parse_line(line) }
    copies = cards.map { 1 }

    cards.each_with_index do |card, i|
      copies[i].times do
        (1..card.num_matches).each do |offset_to_copy|
          copies[i + offset_to_copy] += 1
        end
      end
    end

    copies.sum
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

    def num_matches
      winning_numbers.intersection(actual_numbers).length
    end
  end
end
