# frozen_string_literal: true

module Day1Part2
  def self.solution(lines)
    numbers = lines.flat_map { |line| line.split }.map(&:to_i)
    left, right = numbers.partition.with_index { |_, i| i % 2 == 0 }
    right_counts = right.tally
    left.map { |n| n * (right_counts[n] || 0) }.sum
  end
end
