# frozen_string_literal: true

module Day2Part2
  def self.solution(lines)
    games = lines
      .map { |line| _parse_game(line.strip) }
      .sum { |game| game.power_of_min_cubes_needed }
  end

  private

  Game = Struct.new(:label, :pulls, :keyword_init => true) do
    def power_of_min_cubes_needed
      pulls.map(&:red).max * pulls.map(&:blue).max * pulls.map(&:green).max
    end
  end

  Pull = Struct.new(:red, :blue, :green, :keyword_init => true) do
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
