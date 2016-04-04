# def blocked(sr,sc,er,ec)
# 		if (sr == er && sc == ec)
# 			puts "working ok"
# 			puts sr, sc
# 		else
# 			if sr == er
# 				puts "horiz"
# 				sc = 
# 				blocked(sr,calc_next(sc,ec),er,ec)
# 			elsif sc == ec
# 				puts "vert"
# 				blocked(calc_next(sr,er),sc,er,ec)
# 			else
# 				puts "doooh"
# 				sr,sc = diagonal(sr,sc,er,ec)
# 				blocked(sr,sc,er,ec)
# 			end
# 		end
# 		"Why am I here?"
# 	end
# 	def calc_next(s,e)
# 		s > e ? s - 1 : s + 1
# 	end
# 	def diagonal(sr,sc,er,ec)
# 		return calc_next(sr,er), calc_next(sc,ec)
# 	end


# 	blocked(2,1,2,4)