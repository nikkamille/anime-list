class AnimeList::CLI 

  def start
    greeting
    get_anime_list
    menu
  end

  def greeting
    puts "\n\n\nKon'nichiwa! n_n\n\n\n"
    sleep(1)
    puts "Welcome to my Anime List!\n\n\n"
    sleep(1)
    puts "Search for any anime from the thousands of anime shows and movies!\n\n\n"
  end

  def get_anime_list
    AnimeList::APIManager.get_anime
  end

  def menu
    loop do
      puts "\nWhat do you want to do?\n\n\n"
      sleep(0.5)
      puts "Type 'search' to search for an anime or 'exit' to close the program:"
      input = menu_input
    end
  end
    
  def menu_input
    menu_input = gets.strip.downcase

    case menu_input
    when "search"
      search_anime
    when "exit"
      sayonara
      exit # exits the program
    else
      puts "I'm sorry; I don't know that."
      menu
    end
  end

  def search_anime
    search_title_input
    search_id_input
    menu
  end

  def search_title_input
    puts "\n\nType only ONE word from the title of the anime you're searching:"
    search_title_input = gets.strip.capitalize
    if search_title_input.split(" ").size == 1
      result = AnimeList::Anime.all.select { |anime| anime.title.match(search_title_input) }
      if result.count == 0
        no_result
      else
        result.each do |anime|
          puts "#{anime.id}: #{anime.title}"
        end
      end
    else
      no_result
    end
  end

  def search_id_input
    puts "\n\nType the ID number of the anime you want to learn more about or type 'menu' to go back to the main menu:" 
    search_id_input = gets.strip.downcase 
    if search_id_input == "menu"
      menu
    else
      AnimeList::APIManager.get_anime_info(search_id_input) # Gets all the details about the anime 
    end
  end

  def no_result
    puts "I don't know that anime. Please do another search:"
    search_anime
  end

  def sayonara
    puts "\nSayōnara! See you next time!\n\n"
  end

end