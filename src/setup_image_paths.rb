
all_painting_paths = `find www.ibiblio.org/ -name "*jpg" | grep -v "small.jpg"`.split

artist_painting_map = {}
all_painting_paths.each { |painting_path|
  artist = /.*?auth\/(.*?)\/.*/.match(all_image_paths[1])[1]
  artist_painting_map[artist] = [] if artist_painting_map[artist].nil?

  artist_painting_map[artist] << painting_path
}

artist_painting_map.each { |artist|
  artist_painting_map.delete(artist) if artist_painting_map[artist].size <= 2
}


