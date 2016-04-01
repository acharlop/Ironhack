module Printer
	def print_board
		output = ""
		row = 8
		("a".."h").each do |letr|
			output << row.to_s << " "
			row -= 1
			(1..8).each do |numbr|
				output << " " << (!@board[(letr + numbr.to_s).to_sym].nil? ? @board[(letr + numbr.to_s).to_sym] : "--") << " "
			end
			output << "\n"
		end
		output << "  "
		("a".."h").each do |letr|
			output << " " << letr << "  "
		end
		puts output
	end
end