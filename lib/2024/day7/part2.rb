# frozen_string_literal: true

module Day7Part2
  class Equation
    attr_reader :result

    def initialize(result, values)
      @result = result 
      @values = values
    end

    def self.parse(line)
      left, right = line.split(":")

      new(
        left.to_i,
        right.strip.split(" ").map(&:to_i)
      )
    end

    def can_be_valid?
      return @values.first == @result ? true : false if @values.length == 1

      next_value = @values.first
      return false if next_value > @result

      add_child_values = @values.drop(1)
      add_child_values[0] += next_value

      mult_child_values = @values.drop(1)
      mult_child_values[0] *= next_value

      concat_child_values = @values.drop(1)
      concat_child_values[0] = (next_value.to_s + concat_child_values[0].to_s).to_i

      children = [add_child_values, mult_child_values, concat_child_values].map { |v| self.class.new(@result, v) }
      children.any?(&:can_be_valid?)
    end
  end

  def self.solution(lines)
    lines.map { |l| Equation.parse(l) }.select(&:can_be_valid?).sum(&:result)
  end
end
