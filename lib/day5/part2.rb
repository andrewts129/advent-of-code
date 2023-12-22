# frozen_string_literal: true

module Day5Part2
  def self.solution(lines)
    seed_ranges, maps = _parse_input(lines)

    seed_ranges.map do |seed_range|
      _minimum_location_for_seed_range(seed_range, maps)
    end.min
  end

  private

  def self._minimum_location_for_seed_range(seed_range, maps)
    initial_location = _location(seed_range.first, maps)
    return initial_location if seed_range.size < 2

    lookforward = seed_range.size / 2
    next_seed = seed_range.first + lookforward
    next_location = _location(next_seed, maps)

    range_after_next = (next_seed..seed_range.last)

    if next_location == (initial_location + lookforward)
      [initial_location, _minimum_location_for_seed_range(range_after_next, maps)].min
    else
      range_until_lookforward = (seed_range.first...next_seed)

      [
        _minimum_location_for_seed_range(range_until_lookforward, maps),
        _minimum_location_for_seed_range(range_after_next, maps)
      ].min
    end
  end

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
    values = lines[0].delete_prefix("seeds: ").strip.split.map(&:to_i)

    values.each_slice(2).map do |start, length|
      (start..(start + length))
    end
  end

  def self._parse_maps(lines)
    chunks = lines[1..].chunk { |l| l.strip.length > 0 }.filter_map { |c| c[1] if c[0] }
    chunks.map do |chunk|
      Map.parse(chunk)
    end
  end

  def self._location(value, maps, value_type = "seed")
    return value if value_type == "location"

    relevant_map = maps.detect { |m| m.source == value_type }
    
    _location(relevant_map[value], maps, relevant_map.destination)
  end
end
