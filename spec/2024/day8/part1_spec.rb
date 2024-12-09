# frozen_string_literal: true

require "spec_helper"
require "2024/day8/part1"

describe Day8Part1 do
  describe ".solution" do
    subject(:result) { described_class.solution(input) }

    context "on the sample input" do
      let(:input) { <<~TEXT.split("\n") }
        ............
        ........0...
        .....0......
        .......0....
        ....0.......
        ......A.....
        ............
        ............
        ........A...
        .........A..
        ............
        ............
      TEXT

      it "returns the correct value" do
        expect(result).to eq(14)
      end
    end

    context "on the real input" do
      let(:input) { File.readlines("spec/2024/day8/input.txt") }

      it "returns the correct value" do
        expect(result).to eq(336)
      end
    end
  end
end
