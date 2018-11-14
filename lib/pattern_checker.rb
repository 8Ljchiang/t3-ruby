class PatternChecker
    def initialize(args={})
        @patterns = args.fetch(:patterns, [])
    end

    def contains_matching_pattern(positions)
        counter = 0
        while counter < @patterns.length do
            pattern_positions = @patterns[counter].split(',').map do |element|
                element.to_i
            end
            matches = []
            pattern_positions.each do |element|
                if positions.include?(element)
                    matches.push(element)
                end
            end

            if matches.length == 3
                return true
            end
            counter += 1
        end
        return false
    end
end
