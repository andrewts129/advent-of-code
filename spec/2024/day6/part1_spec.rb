# frozen_string_literal: true

require "spec_helper"
require "2024/day6/part1"

describe Day6Part1 do
  describe ".solution" do
    subject(:result) { described_class.solution(input) }

    context "on the sample input" do
      let(:input) { <<~TEXT.split("\n") }
        ....#.....
        .........#
        ..........
        ..#.......
        .......#..
        ..........
        .#..^.....
        ........#.
        #.........
        ......#...
      TEXT

      it "returns the correct value" do
        expect(result).to eq(41)
      end
    end

    context "on the real input" do
      let(:input) { File.readlines("spec/2024/day6/input.txt") }

      it "returns the correct value" do
        expect(result).to eq(4580)
      end
    end
  end
end
