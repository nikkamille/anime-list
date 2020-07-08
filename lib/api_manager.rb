class AnimeList::APIManager

  BASE_URL = "https://cdn.animenewsnetwork.com/encyclopedia/"

  def self.get_anime
    puts "GETTING MY ANIME LIST...\n\n"

    url = BASE_URL + "reports.xml?id=155&type=anime&nskip=0&nlist=all"
    response = HTTParty.get(url)
    anime_array = response["report"]["item"]
    
    AnimeList::Anime.create_all_from_api(anime_array)
  end

  def self.get_anime_info(anime_id)
    puts "GETTING INFORMATION...\n\n"
    
    anime_object = AnimeList::Anime.all.detect { |anime| anime.id == "#{anime_id}"}

    url = BASE_URL + "api.xml?anime=#{anime_id}"
    response = HTTParty.get(url)
    
    anime_info_array = response["ann"]["anime"]["info"]
    
    anime_object.genre = anime_info_array.map do |hash|
      if hash["type"] == "Genres"
        hash["__content__"]
      end
    end
    anime_object.genre.compact!

    anime_object.num_of_episodes = anime_info_array.map do |hash|
      if hash["type"] == "Number of episodes"
        hash["__content__"]
      end
    end
    anime_object.num_of_episodes.compact!

    anime_object.plot_summary = anime_info_array.map do |hash|
      if hash["type"] == "Plot Summary"
        hash["__content__"]
      end
    end
    anime_object.plot_summary.compact!
    puts anime_object.anime_info
    sleep(5)
  end
   
end
