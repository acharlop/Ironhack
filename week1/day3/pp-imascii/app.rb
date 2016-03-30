require_relative "lib/movies.rb"
require_relative "lib/imascii.rb"
require 'rubygems'
require "imdb"

movies = File.readlines("lib/movies.txt")

#puts movies

list = ImAscii.new(movies)

list.print_rating
list.print_movies