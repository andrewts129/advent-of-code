# frozen_string_literal: true

module Day5Part1
  def self.solution(lines)
    seeds, maps = _parse_input(lines)
    
    _locations(seeds, maps).min
  end

  private

  MapRange = Struct.new(:destination_start, :source_start, :length, :keyword_init => true) do
    def self.parse(lines)
      lines.map do |line|
        values = line.split

        new(
          :destination_start => values[0].to_i,
          :source_start => values[1].to_i,
          :length => values[2].to_i
        )
      end
    end

    def [](x)
      offset = x - source_start

      return nil if offset < 0
      return nil if offset >= length

      destination_start + offset
    end
  end

  Map = Struct.new(:source, :destination, :ranges, :keyword_init => true) do
    def self.parse(lines)
      source, destination = lines[0].strip.delete_suffix(" map:").split("-to-")

      new(
        :source => source,
        :destination => destination,
        :ranges => MapRange.parse(lines[1..])
      )
    end

    def [](x)
      ranges.each do |range|
        return range[x] unless range[x].nil?
      end

      x
    end
  end

  def self._parse_input(lines)
    [_parse_seeds(lines), _parse_maps(lines)]
  end

  def self._parse_seeds(lines)
    lines[0].delete_prefix("seeds: ").strip.split.map(&:to_i)
  end

  def self._parse_maps(lines)
    chunks = lines[1..].chunk { |l| l.strip.length > 0 }.filter_map { |c| c[1] if c[0] }
    chunks.map do |chunk|
      Map.parse(chunk)
    end
  end

  def self._locations(seeds, maps)
    seeds.map do |seed|
      _location(seed, maps, "seed")
    end
  end

  def self._location(value, maps, value_type)
    return value if value_type == "location"

    relevant_map = maps.detect { |m| m.source == value_type } || puts(value_type)
    
    _location(relevant_map[value], maps, relevant_map.destination)
  end
end
