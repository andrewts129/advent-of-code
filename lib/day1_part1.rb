# frozen_string_literal: true

module Day1Part1
  def self.calibration_value(lines)
    lines.sum do |line|
      (_first_digit(line) + _last_digit(line)).to_i
    end
  end

  private

  def self._first_digit(line)
    line.chars.detect { |c| c.match?(/[0-9]/) }
  end

  def self._last_digit(line)
    _first_digit(line.reverse)
  end
end
