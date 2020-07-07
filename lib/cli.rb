class AnimeList::CLI 

  def start
    greeting
    get_anime_list
    menu
  end

  def greeting
    puts "\n\n\nKon'nichiwa! n_n\n\n\n"
    sleep(0.2)
    puts "Welcome to my Anime List!\n\n\n"
    sleep(0.2)
    puts "You can search for a specific anime or learn about a random anime.\n\n\n"
  end

  def get_anime_list
    AnimeList::APIManager.get_anime
  end

  def menu
    loop do
      puts "\n\nWhat do you want to do?\n\n"
      sleep(0.2)
      puts "Type 'search' or 'random' or 'exit':\n\n"
      input = user_input
    end
  end
    
  def user_input
    user_input = gets.strip.downcase

    case user_input
    when "search"
      search_anime
    when "random"
      random_anime
    when "exit"
      sayonara
      exit # exits the program
    else
      puts "I'm sorry; I don't know that."
      menu
    end
  end

  def search_anime
    puts "Type the title of the anime you're searching:"
    search_input = gets.strip.downcase
    result = AnimeList::Anime.all.detect { |anime| search_input == anime.title }
    puts result
  end

  def random_anime
    puts "random anime"
  end

  def sayonara
    puts "\nSayōnara!\n\n"
  end

  def display_anime_info(index)
    anime_object = AnimeList::Anime.all[index]
    AnimeList::APIManager.get_anime_info(anime_object)
  end


end