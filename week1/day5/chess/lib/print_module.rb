module Printer
	def print_board
		output = "\n\n"
		output << "  " << "-" * 32 << "\n"

		8.downto(1).each do |numbr|
			output << numbr.to_s << "|"
			("a".."h").each do |letr|
				# output << " " << letr << numbr.to_s << " "
				output << " " << (!@board[(letr + numbr.to_s).to_sym].nil? ? @board[(letr + numbr.to_s).to_sym].name : "--") << " " 
			end
			output << "|\n"
		end
		output << "  " << "-" * 32 << "\n  "
		("a".."h").each do |letr|
			output << " " << letr << "  "
		end
		puts output
	end
end