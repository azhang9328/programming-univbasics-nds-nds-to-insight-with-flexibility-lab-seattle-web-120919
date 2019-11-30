# Provided, don't edit
require 'directors_database'

# A method we're giving you. This "flattens"  Arrays of Arrays so: [[1,2],
# [3,4,5], [6]] => [1,2,3,4,5,6].

def flatten_a_o_a(aoa)
  result = []
  i = 0

  while i < aoa.length do
    k = 0
    while k < aoa[i].length do
      result << aoa[i][k]
      k += 1
    end
    i += 1
  end

  result
end

def movie_with_director_name(director_name, movie_data)
  { 
    :title => movie_data[:title],
    :worldwide_gross => movie_data[:worldwide_gross],
    :release_year => movie_data[:release_year],
    :studio => movie_data[:studio],
    :director_name => director_name
  }
end


# Your code after this point

def movies_with_director_key(name, movies_collection)
  # GOAL: For each Hash in an Array (movies_collection), provide a collection
  # of movies and a directors name to the movie_with_director_name method
  # and accumulate the returned Array of movies into a new Array that's
  # returned by this method.
  #
  # INPUT:
  # * name: A director's name
  # * movies_collection: An Array of Hashes where each Hash represents a movie
  #
  # RETURN:
  #
  # Array of Hashes where each Hash represents a movie; however, they should all have a
  # :director_name key. This addition can be done by using the provided
  # movie_with_director_name method
  movieArray = []
  dirIndex = 0 
  while dirIndex < movies_collection.length do 
    movieIndex = 0 
    if movieArray.length == 0  
      movieArray.push(movies_collection[movieIndex]) 
      movieArray[movieIndex][:director_name] = name
      puts "nothing in array added #{movieArray} + #{movieArray.length}"
      movieIndex += 1
    else 
      puts "stuff in array, adding director"
      movieArray.push(movies_collection[movieIndex + 1])
      movieArray[movieIndex + 1][:director_name] = name
      movieIndex += 1
    end
    dirIndex += 1
  end   
  puts movieArray
  movieArray
end


def gross_per_studio(collection)
  # GOAL: Given an Array of Hashes where each Hash represents a movie,
  # return a Hash that includes the total worldwide_gross of all the movies from
  # each studio.
  #
  # INPUT:
  # * collection: Array of Hashes where each Hash where each Hash represents a movie
  #
  # RETURN:
  #
  # Hash whose keys are the studio names and whose values are the sum
  # total of all the worldwide_gross numbers for every movie in the input Hash
  grossHash = {}
  index = 0 
  
  while index < collection.length do 
  puts collection
  puts collection[index][:title]
  puts collection[index][:worldwide_gross]
    
  
  index += 1
  end 

  grossHash
end

def movies_with_directors_set(source)
  # GOAL: For each director, find their :movies Array and stick it in a new Array
  #
  # INPUT:
  # * source: An Array of Hashes containing director information including
  # :name and :movies
  #
  # RETURN:
  #
  # Array of Arrays containing all of a director's movies. Each movie will need
  # to have a :director_name key added to it.
  directorArray = []
  dirIndex = 0 
  while dirIndex < source.length do 
  movieIndex = 0
    while movieIndex < source[dirIndex][:movies].length do 
    #directorArray.push([:title => source[dirIndex][:movies][movieIndex][:title], :director_name => source[dirIndex][:name]])
    directorArray.push([source[dirIndex][:movies][movieIndex], source[dirIndex][:movies][movieIndex][:director_name] = source[dirIndex][:name]])
    movieIndex += 1
    end
  dirIndex += 1
  end
  directorArray
end

# ----------------    End of Your Code Region --------------------
# Don't edit the following code! Make the methods above work with this method
# call code. You'll have to "see-saw" to get this to work!

def studios_totals(nds)
  a_o_a_movies_with_director_names = movies_with_directors_set(nds)
  movies_with_director_names = flatten_a_o_a(a_o_a_movies_with_director_names)
  return gross_per_studio(movies_with_director_names)
end
