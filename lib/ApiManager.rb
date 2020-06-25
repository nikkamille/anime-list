class AnimeList::APIManager

  url = URI("https://jikan1.p.rapidapi.com/anime/16498/episodes")

  http = Net::HTTP.new(url.host, url.port)
  http.use_ssl = true
  http.verify_mode = OpenSSL::SSL::VERIFY_NONE

  request = Net::HTTP::Get.new(url)
  request["x-rapidapi-host"] = 'jikan1.p.rapidapi.com'
  request["x-rapidapi-key"] = '51e2568b81mshdb3e107db778b28p10d850jsnd6acbbfedf7a'

  response = http.request(request)


end
