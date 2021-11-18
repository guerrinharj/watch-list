# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

Movie.destroy_all
List.destroy_all
Bookmark.destroy_all

require 'json'
require 'open-uri'

url = "http://tmdb.lewagon.com/movie/top_rated"
res = URI.open(url)
json = JSON.parse(res.read)

movies = json['results']
lists = ["Drama", "Comedy", "Action", "Thriller", "Documentary"]

movies.each do |movie|
  Movie.create!(
    title: movie['title'],
    overview: movie['overview'],
    poster_url: "https://image.tmdb.org/t/p/original#{movie['poster_path']}",
    rating: movie['vote_average']
  )
end

lists.each do |list|
  List.create!(
    name: list
  )
end

10.times do
  Bookmark.create!(
    movie_id: rand(Movie.first.id...Movie.last.id),
    list_id: rand(List.first.id...List.last.id),
    comment: "This is a comment!"
  )
end
