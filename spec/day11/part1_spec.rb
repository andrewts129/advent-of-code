# frozen_string_literal: true

require "spec_helper"
require "day11/part1"

describe Day11Part1 do
  describe ".solution" do
    subject(:result) { described_class.solution(input) }

    context "on the sample input" do
      let(:input) { <<~TEXT.split("\n") }
        ...#......
        .......#..
        #.........
        ..........
        ......#...
        .#........
        .........#
        ..........
        .......#..
        #...#.....
      TEXT

      it "returns the correct value" do
        expect(result).to eq(374)
      end
    end

    context "on the real input" do
      let(:input) { File.readlines("spec/day11/input.txt") }

      it "returns the correct value" do
        expect(result).to eq(9556896)
      end
    end
  end
end
