# frozen_string_literal: true

require "spec_helper"
require "day2/part2"

describe Day2Part2 do
  describe ".solution" do
    subject(:result) { described_class.solution(input) }

    context "on the sample input" do
      let(:input) { <<~TEXT.split("\n") }
        Game 1: 3 blue, 4 red; 1 red, 2 green, 6 blue; 2 green
        Game 2: 1 blue, 2 green; 3 green, 4 blue, 1 red; 1 green, 1 blue
        Game 3: 8 green, 6 blue, 20 red; 5 blue, 4 red, 13 green; 5 green, 1 red
        Game 4: 1 green, 3 red, 6 blue; 3 green, 6 red; 3 green, 15 blue, 14 red
        Game 5: 6 red, 1 blue, 3 green; 2 blue, 1 red, 2 green
      TEXT

      it "returns the correct value" do
        expect(result).to eq(2286)
      end
    end

    context "on the sample input" do
      let(:input) { File.readlines("spec/day2/input.txt") }

      it "returns the correct value" do
        expect(result).to eq(65122)
      end
    end
  end
end
