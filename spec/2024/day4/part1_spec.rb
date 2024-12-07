# frozen_string_literal: true

require "spec_helper"
require "2024/day4/part1"

describe Day4Part1 do
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

      let(:foo) { <<~TEXT.split("\n") }
        ....XXMAS.
        .SAMXMS...
        ...S..A...
        ..A.A.MS.X
        XMASAMX.MM
        X.....XA.A
        S.S.S.S.SS
        .A.A.A.A.A
        ..M.M.M.MM
        .X.X.XMASX
      TEXT


      it "returns the correct value" do
        expect(result).to eq(18)
      end
    end

    context "on the real input" do
      let(:input) { File.readlines("spec/2024/day4/input.txt") }

      it "returns the correct value" do
        expect(result).to eq(2685)
      end
    end
  end
end
