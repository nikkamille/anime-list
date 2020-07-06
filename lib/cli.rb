class AnimeList::CLI 

  def start
    greeting
    menu
    get_anime_list
  end

  def greeting
    puts "\n\nKon'nichiwa! n_n\n\n"
    sleep(0.5)
    puts "Welcome to my Anime List!\n\n"
  end

  def menu
    puts "in menu"
  end

  def get_anime_list
    AnimeList::APIManager.get_anime
  end


end