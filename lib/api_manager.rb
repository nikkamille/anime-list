class AnimeList::APIManager

  # def get_anime
  
  #   url = URI("https://jikan1.p.rapidapi.com/top/anime/1/upcoming")

  #   http = Net::HTTP.new(url.host, url.port)
  #   http.use_ssl = true
  #   http.verify_mode = OpenSSL::SSL::VERIFY_NONE

  #   request = Net::HTTP::Get.new(url)
  #   request["x-rapidapi-host"] = 'jikan1.p.rapidapi.com'
  #   request["x-rapidapi-key"] = '51e2568b81mshdb3e107db778b28p10d850jsnd6acbbfedf7a'

  #   response = http.request(request)
  #   result = response.read_body
  #   parsed = JSON.parse(result)
  #   binding.pry

  # end

  BASE_URL = "https://cdn.animenewsnetwork.com/encyclopedia/"

  def self.get_anime
    puts "Preparing the animes...\n\n"

    url = BASE_URL + "reports.xml?id=155&type=anime&nskip=0&nlist=all"
    response = HTTParty.get(url)
    anime_array = response["report"]["item"]
    # anime_hash = response["report"]
    # anime_array = anime_hash["item"]
  
    AnimeList::Anime.create_all_from_api(anime_array)
  end

  def self.get_anime_info(anime_id)
    url = BASE_URL + "api.xml?anime=#{anime_id}"
    response = HTTParty.get(url)
    
    anime_info_array = response["ann"]["anime"]["info"]
    
    anime_genre = anime_info_array.map do |hash|
      if hash["type"] == "Genres"
        hash["__content__"]
      end
    end
    anime_genre.compact!

    anime_num_of_episodes = anime_info_array.map do |hash|
      if hash["type"] == "Number of episodes"
        hash["__content__"]
      end
    end
    anime_num_of_episodes.compact!

    anime_plot_summary = anime_info_array.map do |hash|
      if hash["type"] == "Plot Summary"
        hash["__content__"]
      end
    end
    anime_plot_summary.compact!
      
  end
  binding.pry 
end
