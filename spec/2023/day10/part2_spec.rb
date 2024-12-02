# frozen_string_literal: true

require "spec_helper"
require "2023/day10/part2"

describe Day10Part2 do
  describe ".solution" do
    subject(:result) { described_class.solution(input) }

    context "on the first sample input" do
      let(:input) { <<~TEXT.split("\n") }
        ...........
        .S-------7.
        .|F-----7|.
        .||.....||.
        .||.....||.
        .|L-7.F-J|.
        .|..|.|..|.
        .L--J.L--J.
        ...........
      TEXT

      it "returns the correct value" do
        expect(result).to eq(4)
      end
    end

    context "on the second sample input" do
      let(:input) { <<~TEXT.split("\n") }
        ..........
        .S------7.
        .|F----7|.
        .||....||.
        .||....||.
        .|L-7F-J|.
        .|..||..|.
        .L--JL--J.
        ..........
      TEXT

      it "returns the correct value" do
        expect(result).to eq(4)
      end
    end

    context "on the third sample input" do
      let(:input) { <<~TEXT.split("\n") }
        .F----7F7F7F7F-7....
        .|F--7||||||||FJ....
        .||.FJ||||||||L7....
        FJL7L7LJLJ||LJ.L-7..
        L--J.L7...LJS7F-7L7.
        ....F-J..F7FJ|L7L7L7
        ....L7.F7||L7|.L7L7|
        .....|FJLJ|FJ|F7|.LJ
        ....FJL-7.||.||||...
        ....L---J.LJ.LJLJ...
      TEXT

      it "returns the correct value" do
        expect(result).to eq(8)
      end
    end

    context "on the fourth sample input" do
      let(:input) { <<~TEXT.split("\n") }
        FF7FSF7F7F7F7F7F---7
        L|LJ||||||||||||F--J
        FL-7LJLJ||||||LJL-77
        F--JF--7||LJLJ7F7FJ-
        L---JF-JLJ.||-FJLJJ7
        |F|F-JF---7F7-L7L|7|
        |FFJF7L7F-JF7|JL---7
        7-L-JL7||F7|L7F-7F7|
        L.L7LFJ|||||FJL7||LJ
        L7JLJL-JLJLJL--JLJ.L
      TEXT

      it "returns the correct value" do
        expect(result).to eq(10)
      end
    end

    context "on the real input" do
      let(:input) { File.readlines("spec/2023/day10/input.txt") }

      it "returns the correct value" do
        expect(result).to eq(269)
      end
    end
  end
end
