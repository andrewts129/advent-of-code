# frozen_string_literal: true

module Day6Part1
  def self.solution(lines)
    races = _parse_input(lines)
    races.map(&:ways_to_win).inject(&:*)
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
    times = lines[0].delete_prefix("Time:").strip.split.map(&:to_i)
    distances = lines[1].delete_prefix("Distance:").strip.split.map(&:to_i)

    times.zip(distances).map do |time, distance|
      Race.new(
        :max_charge_time => time,
        :max_distance => distance
      )
    end
  end
end
