# frozen_string_literal: true

module Day9Part1
  def self.solution(lines)
    _histories(lines).map(&:prediction).sum
  end

  private

  History = Struct.new(:readings, :keyword_init => true) do
    def self.parse(line)
      new(:readings => line.split.map(&:to_i))
    end

    def prediction
      deltas = readings.each_cons(2).map { |a, b| b - a}
      
      if deltas.uniq.length == 1
        readings.last + deltas.first
      else
        readings.last + History.new(:readings => deltas).prediction
      end
    end
  end

  def self._histories(lines)
    lines.map do |line|
      History.parse(line.strip)
    end
  end
end
