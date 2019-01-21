class PatternChecker
  def initialize(args = {})
    @patterns = args.fetch(:patterns, [])
  end

  def contains_matching_pattern(positions)
    counter = 0
    while counter < @patterns.length
      pattern_positions = @patterns[counter].split(',').map(&:to_i)
      matches = []
      pattern_positions.each do |element|
        matches.push(element) if positions.include?(element)
      end

      return true if matches.length == pattern_positions.length

      counter += 1
    end
    false
  end

  def get_matching_pattern(positions)
    counter = 0
    while counter < @patterns.length
      pattern_positions = @patterns[counter].split(',').map(&:to_i)
      matches = []
      pattern_positions.each do |element|
        matches.push(element) if positions.include?(element)
      end

      return matches if matches.length == 3

      counter += 1
    end
    []
  end
end
