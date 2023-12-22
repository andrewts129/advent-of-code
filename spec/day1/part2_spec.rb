# frozen_string_literal: true

require "spec_helper"
require "day1/part2"

describe Day1Part2 do
  describe ".calibration_value" do
    subject(:result) { described_class.calibration_value(input) }

    context "on the sample input" do
      let(:input) { <<~TEXT.split("\n") }
        two1nine
        eightwothree
        abcone2threexyz
        xtwone3four
        4nineeightseven2
        zoneight234
        7pqrstsixteen
      TEXT

      it "returns the correct value" do
        expect(result).to eq(281)
      end
    end

    context "on the sample input" do
      let(:input) { File.readlines("spec/day1/input.txt") }

      it "returns the correct value" do
        expect(result).to eq(54925)
      end
    end
  end
end
