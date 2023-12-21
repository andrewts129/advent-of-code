# frozen_string_literal: true

require "spec_helper"
require "day1_part1"

describe Day1Part1 do
  describe ".calibration_value" do
    subject(:result) { described_class.calibration_value(input) }
    
    context "on the sample input" do
      let(:input) { <<~TEXT.split("\n") }
        1abc2
        pqr3stu8vwx
        a1b2c3d4e5f
        treb7uchet
      TEXT

      it "returns the correct value" do
        expect(result).to eq(142)
      end
    end

    context "on the sample input" do
      let(:input) { File.readlines("spec/input/day1.txt") }

      it "returns the correct value" do
        expect(result).to eq(55172)
      end
    end
  end
end
