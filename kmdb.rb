# In this assignment, you'll be using the domain model from hw1 (found in the hw1-solution.sql file)
# to create the database structure for "KMDB" (the Kellogg Movie Database).
# The end product will be a report that prints the movies and the top-billed
# cast for each movie in the database.

# To run this file, run the following command at your terminal prompt:
# `rails runner kmdb.rb`

# Requirements/assumptions
#
# - There will only be three movies in the database – the three films
#   that make up Christopher Nolan's Batman trilogy
# - Movie data includes the movie title, year released, MPAA rating,
#   and director
# - A movie has a single director
# - A person can be the director of and/or play a role in a movie
# - Everything you need to do in this assignment is marked with TODO!

# Rubric
# 
# There are three deliverables for this assignment, all delivered within
# this repository and submitted via GitHub and Canvas:
# - Generate the models and migration files to match the domain model from hw1.
#   Execute the migration files to create the tables in the database. Add the
#   relevant association methods in each model. (5 points)
# - Insert the "Batman" sample data using ruby code. Do not use hard-coded ids and
#   delete any existing data beforehand so that each run of this script does not
#   create duplicate data. (5 points)
# - Query the data and loop through it to display output similar to the following
#   sample "report". (10 points)

# Submission
# 
# - "Use this template" to create a brand-new "hw2" repository in your
#   personal GitHub account, e.g. https://github.com/<USERNAME>/hw2
# - Do the assignment, committing and syncing often
# - When done, commit and sync a final time, before submitting the GitHub
#   URL for the finished "hw2" repository as the "Website URL" for the 
#   Homework 2 assignment in Canvas

# Successful sample output is as shown:

# Movies
# ======

# Batman Begins          2005           PG-13  Christopher Nolan
# The Dark Knight        2008           PG-13  Christopher Nolan
# The Dark Knight Rises  2012           PG-13  Christopher Nolan

# Top Cast
# ========

# Batman Begins          Christian Bale        Bruce Wayne
# Batman Begins          Michael Caine         Alfred
# Batman Begins          Liam Neeson           Ra's Al Ghul
# Batman Begins          Katie Holmes          Rachel Dawes
# Batman Begins          Gary Oldman           Commissioner Gordon
# The Dark Knight        Christian Bale        Bruce Wayne
# The Dark Knight        Heath Ledger          Joker
# The Dark Knight        Aaron Eckhart         Harvey Dent
# The Dark Knight        Michael Caine         Alfred
# The Dark Knight        Maggie Gyllenhaal     Rachel Dawes
# The Dark Knight Rises  Christian Bale        Bruce Wayne
# The Dark Knight Rises  Gary Oldman           Commissioner Gordon
# The Dark Knight Rises  Tom Hardy             Bane
# The Dark Knight Rises  Joseph Gordon-Levitt  John Blake
# The Dark Knight Rises  Anne Hathaway         Selina Kyle

# Delete existing data, so you'll start fresh each time this script is run.
# Use `Model.destroy_all` code.
# TODO!

Movie.destroy_all
Artist.destroy_all
Role.destroy_all

# Generate models and tables, according to the domain model
# TODO!
#rails generate model Movie
    #t.string :title
    #t.string :year_released
    #t.string :rating
    #t.string :artist_id
#rails generate model Artist
    #t.string :name
#rails generate model Role
    #t.string :movie_id
    #t.string :artist_id
    #t.string :character_name
#rails db:migrate
#rails runner data.rb
#rails runner kmdb.rb
# Insert data into your database that reflects the sample data shown above
# Do not use hard-coded foreign key IDs.
# TODO!

#nolan comes first
#nolans = Artist.where({ name: "Christopher Nolan"}).[0]
nolan = Artist.new
nolan.name = "Christopher Nolan"
nolan.save

bb = Movie.new
bb.title = "Batman Begins"
bb.year_released = 2005
bb.rating = "PG-13"
bb.artist_id = nolan.id #write code association to link (has many & belong)
bb.save

dk = Movie.new
dk.title = "The Dark Knight"
dk.year_released = 2008
dk.rating = "PG-13" 
dk.artist_id = nolan.id #nolan.id #write code association to link (has many & belong)
dk.save

dkr = Movie.new
dkr.title = "The Dark Knight Rises"
dkr.year_released = 2012
dkr.rating = "PG-13" 
dkr.artist_id = nolan.id #nolan.id #write code association to link (has many & belong)
dkr.save


#bb
bale = Artist.new
bale.name = "Christian Bale"
bale.save

waynebb = Role.new
waynebb.movie_id = bb.id #movie_id
waynebb.artist_id = bale.id #artist_id
waynebb.character_name = "Bruce Wayne"
waynebb.save

caine = Artist.new
caine.name = "Michael Caine"
caine.save

alfredbb = Role.new
alfredbb.movie_id = bb.id #movie_id
alfredbb.artist_id = caine.id #artist_id
alfredbb.character_name = "Alfred"
alfredbb.save

neeson = Artist.new
neeson.name = "Liam Neeson"
neeson.save

ghulbb = Role.new
ghulbb.movie_id = bb.id #movie_id
ghulbb.artist_id = neeson.id #artist_id
ghulbb.character_name = "Ra's Al Ghul"
ghulbb.save

holmes = Artist.new
holmes.name = "Katie Holmes"
holmes.save 

dawesbb = Role.new
dawesbb.movie_id = bb.id #movie_id
dawesbb.artist_id = holmes.id #artist_id
dawesbb.character_name = "Rachel Dawes"
dawesbb.save

oldman = Artist.new
oldman.name = "Gary Oldman"
oldman.save

gordonbb = Role.new
gordonbb.movie_id = bb.id #movie_id
gordonbb.artist_id = oldman.id #artist_id
gordonbb.character_name = "Commissioner Gordon"
gordonbb.save

#dk repeating
waynedk = Role.new
waynedk.movie_id = dk.id #movie_id
waynedk.artist_id = bale.id #artist_id
waynedk.character_name = "Bruce Wayne"
waynedk.save

#dk new
ledger = Artist.new
ledger.name = "Heath Ledger"
ledger.save

jokerdk = Role.new
jokerdk.movie_id = dk.id #movie_id
jokerdk.artist_id = ledger.id #artist_id
jokerdk.character_name = "Joker"
jokerdk.save

eckhart = Artist.new
eckhart.name = "Aaron Eckhart"
eckhart.save

dentdk = Role.new
dentdk.movie_id = dk.id #movie_id
dentdk.artist_id = eckhart.id #artist_id
dentdk.character_name = "Harvey Dent"
dentdk.save

#dk repeating
alfreddk = Role.new
alfreddk.movie_id = dk.id #movie_id
alfreddk.artist_id = caine.id #artist_id
alfreddk.character_name = "Alfred"
alfreddk.save

#dk new cont.
gyllenhaal = Artist.new
gyllenhaal.name = "Maggie Gyllenhaal"
gyllenhaal.save

dawesdk = Role.new
dawesdk.movie_id = dk.id #movie_id
dawesdk.artist_id = gyllenhaal.id #artist_id
dawesdk.character_name = "Rachel Dawes"
dawesdk.save

#dkr repeating
waynedk = Role.new
waynedk.movie_id = dkr.id #movie_id
waynedk.artist_id = bale.id #artist_id
waynedk.character_name = "Bruce Wayne"
waynedk.save

gordondk = Role.new
gordondk.movie_id = dkr.id #movie_id
gordondk.artist_id = oldman.id #artist_id
gordondk.character_name = "Commissioner Gordon"
gordondk.save

#dkr 
hardy = Artist.new
hardy.name = "Tom Hardy"
hardy.save 

banedk = Role.new
banedk.movie_id = dkr.id #movie_id
banedk.artist_id = hardy.id #artist_id
banedk.character_name = "Bane"
banedk.save

levitt = Artist.new
levitt.name = "Joseph Gordon-Levitt"
levitt.save 

blakedk = Role.new
blakedk.movie_id = dkr.id #movie_id
blakedk.artist_id = levitt.id #artist_id
blakedk.character_name = "John Blake"
blakedk.save

hathaway = Artist.new
hathaway.name = "Anne Hathaway"
hathaway.save

kyledk = Role.new
kyledk.movie_id = dkr.id #movie_id
kyledk.artist_id = hathaway.id #artist_id
kyledk.character_name = "Selina Kyle"
kyledk.save


puts "There are #{Movie.all.count} movies. Should be 3" 
puts "There are #{Artist.all.count} artists. Should be 12"
puts "There are #{Role.all.count} roles. Should be 15."

# Prints a header for the movies output
puts "Movies"
puts "======"
puts ""

# Query the movies data and loop through the results to display the movies output
# TODO!

movies = Movie.all
artists = Artist.all
roles = Role.all
for movie in movies
    director = Artist.where({ id: movie.artist_id})[0]
    puts "#{movie.title} #{movie.year_released} #{movie.rating}  #{director.name}" #fixed this link
end

# Prints a header for the cast output
puts ""
puts "Top Cast"
puts "========"
puts ""

# Query the cast data and loop through the results to display the cast output for each movie
# TODO!

#use this
for role in roles
    movie_for_role = Movie.where({ id: role.movie_id})[0]
    actor = Artist.where({ id: role.artist_id})[0]
    puts "#{movie_for_role.title} #{actor.name} #{role.character_name}"
end 


#extra notes below
# artists = Artist.all
# for artist in artists
#     for role in roles
#     puts "#{movie.title}, #{artist.name} #{role.character_name}"
#     end
# end



