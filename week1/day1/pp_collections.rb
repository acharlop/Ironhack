class ProgrammingLanguage
	attr_accessor :name, :age, :type
	def initialize(name, age, type)
		@name = name
		@age = age
		@type = type
	end
end

ruby = ProgrammingLanguage.new("Ruby", 21, "Dynamic")
python = ProgrammingLanguage.new("Python", 24, "Dynamic")
javascript = ProgrammingLanguage.new("JavaScript", 20, "Dynamic")
go = ProgrammingLanguage.new("Go", 6, "Static")
rust = ProgrammingLanguage.new("Rust", 5, "Static")
swift = ProgrammingLanguage.new("Swift", 2, "Static")
java = ProgrammingLanguage.new("Java", 20, "Static")

array_of_languages = [ruby, python, javascript, go, rust, swift, java]

def array_printer(array)
  array.each do | language |
    puts "Language: #{language.name} |  Age: #{language.age} |  Type System: #{language.type}"
  end
end

puts "First print"
array_printer(array_of_languages)
puts
#
aged_languages = array_of_languages.map do |lang| 
	lang.age += 1
	lang
end
puts "Map"
array_printer(aged_languages)
puts
#
puts "Sort"
sorted_languages = aged_languages.sort_by{|lang|lang.age}.reverse
array_printer(sorted_languages)
puts
#
static_langages = array_of_languages.drop_while{|lang| lang.type == "Dynamic"}
puts "Drop While"
array_printer(static_langages)
puts
#
puts "Pre Rotated"
array_printer(array_of_languages)
puts
puts "Rotated no bang"
aray_rotated = array_of_languages.rotate(-2)
array_printer(aray_rotated)
puts
puts "Post Rotated with a bang"
array_of_languages.rotate!(-2)
array_printer(array_of_languages)
puts
#
puts "Shift"
lang_shift = array_of_languages.shift
array_printer([lang_shift])
puts "Pop"
lang_pop = array_of_languages.pop
array_printer([lang_pop])
puts "Array"
array_printer(array_of_languages)
puts
puts "Fixed"
array_of_languages.unshift(lang_shift)
array_of_languages.push(lang_pop)
array_printer(array_of_languages)
puts


