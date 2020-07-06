class AnimeList::Anime 

  attr_accessor :title, :id, :type, :date
  
  @@all = []

  def self.all
    @@all
  end

  def initialize(title, id) 
    @title, @id = title, id
    save
  end

  def save
    @@all << self
  end

  def self.create_all_from_api(anime_array)
    anime_array.each do |anime|
      self.new(anime["name"], anime["id"]) #, anime["type"], anime["vintage"])
    end
  end




end
