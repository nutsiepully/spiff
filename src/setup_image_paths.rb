
require 'rubygems'
#require 'ruby-debug'

=begin
  This file is supposed to run over all the images in the dataset and generate
  the following.

  imPaths - The list of all the images
  imTrs - The list of all training images
  imTss - The list of all the test images
  csTrs - Classes of all the training images
  csTss - Classes of all the test images
  mapping - Mapping class values to names
=end

# Might want to use the small image instead of the full resolution image
all_painting_paths = `find ../datasets/www.ibiblio.org/ -name "*jpg" | grep -v "small.jpg"`.split

artist_painting_map = {}
all_painting_paths.each { |painting_path|
  artist = /.*?auth\/(.*?)\/.*/.match(painting_path)[1]
  artist_painting_map[artist] = [] if artist_painting_map[artist].nil?

  artist_painting_map[artist] << painting_path
}

artist_painting_map.keys.each { |artist|
  artist_painting_map.delete(artist) if artist_painting_map[artist].size <= 5
}

mapping = artist_painting_map.keys

imPaths = artist_painting_map.values.flatten

imTrs = imTss = csTrs = csTss = []
artist_painting_map.keys.each_with_index { |artist, index|
  paintings = artist_painting_map[artist]
  num_take = (paintings.size * 0.7).floor

  imTrs += paintings.take(num_take)
  imTss += paintings[num_take..-1]

  csTrs += [ index + 1 ] * num_take
  csTss += [ index + 1 ] * (paintings.size - num_take)
}

File.write("../out/imPaths.txt", imPaths.join("\n"))
File.write("../out/mapping.txt", mapping.join("\n"))
File.write("../out/imTrs.txt", imTrs.join("\n"))
File.write("../out/imTss.txt", imTss.join("\n"))
File.write("../out/csTrs.txt", csTrs.join("\n"))
File.write("../out/csTss.txt", csTss.join("\n"))

