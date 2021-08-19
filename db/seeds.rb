require 'json'
require 'open-uri'

url = 'http://tmdb.lewagon.com/movie/top_rated?api_key=<your_api_key>'
user_serialized = URI.open(url).read
movies = JSON.parse(user_serialized)

p 'destroy all data'

Movie.destroy_all
p 'Create new data'
movies['results'].each do |movie|
  Movie.create(title: movie['title'], overview: movie['overview'], poster_url: movie['poster_path'], rating: movie['vote_average'])
end



p 'finished'
