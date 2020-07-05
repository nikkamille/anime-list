class AnimeList::Anime 

  @@all = []

  def self.all
    @@all
  end

  def initialize(name, type, date)
    @name, @type, @date = name, type, date 
    save
  end

  def save
    @@all << self
  end

  def self.create_all_from_api(anime_array)
    anime_array.each do |anime|
      self.new(anime["name"], anime["type"], anime["vintage"])
    end
  end



end
