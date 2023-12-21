# frozen_string_literal: true

module Day1Part2
  def self.calibration_value(lines)
    lines.sum do |line|
      (_first_digit(line) + _last_digit(line)).to_i
    end
  end

  SUBS = {
    **(1..9).to_h { |c| [c.to_s, c.to_s] },
    "one" => "1",
    "two" => "2",
    "three" => "3",
    "four" => "4",
    "five" => "5",
    "six" => "6",
    "seven" => "7",
    "eight" => "8",
    "nine" => "9"
  }.freeze

  def self._first_digit(line)
    SUBS.min_by { |(word, _)| line.index(word) || Float::INFINITY }[1]
  end

  def self._last_digit(line)
    SUBS.max_by { |(word, _)| line.rindex(word) || -1 }[1]
  end
end
