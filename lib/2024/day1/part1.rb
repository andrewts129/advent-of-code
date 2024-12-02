# frozen_string_literal: true

module Day1Part1
  def self.solution(lines)
    numbers = lines.flat_map { |line| line.split }.map(&:to_i)
    first, second = numbers.partition.with_index { |_, i| i % 2 == 0 }
    first.sort.zip(second.sort).sum do |n1, n2|
      (n1 - n2).abs
    end
  end
end
