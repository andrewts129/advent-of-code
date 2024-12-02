# frozen_string_literal: true

module Day6Part2
  def self.solution(lines)
    race = _parse_input(lines)
    race.ways_to_win
  end

  private

  Race = Struct.new(:max_charge_time, :max_distance, :keyword_init => true) do
    def ways_to_win
      (0..max_charge_time).count do |charge_time|
        _victory?(charge_time)
      end
    end

    private

    def _victory?(charge_time)
      time_moving = max_charge_time - charge_time
      distance_traveled = time_moving * charge_time
      distance_traveled > max_distance
    end
  end

  def self._parse_input(lines)
    Race.new(
      :max_charge_time => lines[0].delete_prefix("Time:").strip.gsub(" ", "").to_i,
      :max_distance => lines[1].delete_prefix("Distance:").strip.gsub(" ", "").to_i
    )
  end
end
