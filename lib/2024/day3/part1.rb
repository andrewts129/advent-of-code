# frozen_string_literal: true

module Day3Part1
  class Instruction
    def initialize(left, right)
      @left = left 
      @right = right
    end

    def result
      @left * @right
    end
  end

  class InstructionSet
    def initialize(instructions)
      @instructions = instructions
    end

    def self.parse(input)
      instructions = input.scan(/mul\((\d{1,3}),(\d{1,3})\)/).map do |left, right|
        Instruction.new(left.to_i, right.to_i)
      end

      new(instructions)
    end

    def result
      @instructions.map(&:result).sum
    end
  end

  def self.solution(lines)
    InstructionSet.parse(lines.join).result
  end
end
