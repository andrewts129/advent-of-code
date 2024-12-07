# frozen_string_literal: true

require "spec_helper"
require "2024/day4/part2"

describe Day4Part2 do
  describe ".solution" do
    subject(:result) { described_class.solution(input) }

    context "on the sample input" do
      let(:input) { <<~TEXT.split("\n") }
        MMMSXXMASM
        MSAMXMSMSA
        AMXSXMAAMM
        MSAMASMSMX
        XMASAMXAMM
        XXAMMXXAMA
        SMSMSASXSS
        SAXAMASAAA
        MAMMMXMMMM
        MXMXAXMASX
      TEXT

      it "returns the correct value" do
        expect(result).to eq(9)
      end
    end

    context "on the real input" do
      let(:input) { File.readlines("spec/2024/day4/input.txt") }

      it "returns the correct value" do
        expect(result).to eq(2048)
      end
    end
  end
end
