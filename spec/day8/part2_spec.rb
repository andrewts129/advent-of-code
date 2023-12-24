# frozen_string_literal: true

require "spec_helper"
require "day8/part2"

describe Day8Part2 do
  describe ".solution" do
    subject(:result) { described_class.solution(input) }

    context "on the sample input" do
      let(:input) { <<~TEXT.split("\n") }
        LR

        11A = (11B, XXX)
        11B = (XXX, 11Z)
        11Z = (11B, XXX)
        22A = (22B, XXX)
        22B = (22C, 22C)
        22C = (22Z, 22Z)
        22Z = (22B, 22B)
        XXX = (XXX, XXX)
      TEXT

      it "returns the correct value" do
        expect(result).to eq(6)
      end
    end

    context "on the real input" do
      let(:input) { File.readlines("spec/day8/input.txt") }

      it "returns the correct value" do
        expect(result).to eq(14321394058031)
      end
    end
  end
end
