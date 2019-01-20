module T3Engine
	module InputUtils
		def self.parse_move_input(input)
			begin
				if input.is_a? Integer
					return input
				else
					return Integer(input, 10)
				end
			rescue => exception
				return nil
			end
		end
	end
end