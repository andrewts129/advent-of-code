# frozen_string_literal: true

require "spec_helper"
require "day3_part1"

describe Day3Part1 do
  describe ".solution" do
    subject(:result) { described_class.solution(input) }

    context "on the sample input" do
      let(:input) { <<~TEXT.split("\n") }
        467..114..
        ...*......
        ..35..633.
        ......#...
        617*......
        .....+.58.
        ..592.....
        ......755.
        ...$.*....
        .664.598..
      TEXT

      it "returns the correct value" do
        expect(result).to eq(4361)
      end
    end

    context "on the sample input" do
      let(:input) { File.readlines("spec/input/day3.txt") }

      it "returns the correct value" do
        expect(result).to eq(544433)
      end
    end
  end
end
