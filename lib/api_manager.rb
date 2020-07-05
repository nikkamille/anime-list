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
    puts "getting anime"

    url = BASE_URL + "reports.xml?id=155&type=anime&nskip=0&nlist=all"
    response = HTTParty.get(url)
    anime_hash = response["report"]
    anime_array = anime_hash["item"]

    AnimeList::Anime.create_all_from_api(anime_array)



  end


end
