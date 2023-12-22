# frozen_string_literal: true

module Day2Part1
  def self.solution(lines)
    lines
      .map { |line| _parse_game(line) }
      .select(&:possible?)
      .sum { |game| game.label.to_i }
  end

  private

  Game = Struct.new(:label, :pulls, :keyword_init => true) do
    def possible?
      pulls.all?(&:possible?)
    end
  end

  Pull = Struct.new(:red, :blue, :green, :keyword_init => true) do
    def possible?
      red <= 12 && green <= 13 && blue <= 14
    end
  end

  def self._parse_game(line)
    Game.new(
      :label => line.match(/Game (\d+):/)[1],
      :pulls => _parse_pulls(line)
    )
  end

  def self._parse_pulls(line)
    all_pulls = line.gsub(/Game \d+: /, "")
    all_pulls.split("; ").map do |list_of_pulls|
      Pull.new(
        :red => _get_number_of_color("red", list_of_pulls),
        :blue => _get_number_of_color("blue", list_of_pulls),
        :green => _get_number_of_color("green", list_of_pulls)
      )
    end
  end

  def self._get_number_of_color(color, list_of_pulls)
    relevant_pull = list_of_pulls.split(", ").detect { |pull| pull.end_with?(color) }
    return 0 if relevant_pull.nil?

    relevant_pull.match(/([0-9]+)/)[0].to_i
  end
end
