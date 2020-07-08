class AnimeList::Anime 

  attr_accessor :id, :title, :type, :date
  
  @@all = []

  def self.all
    @@all
  end

  def initialize(id, title, type, date) 
    @id, @title, @type, @date = id, title, type, date
    save
  end

  def save
    @@all << self
  end

  def self.create_all_from_api(anime_array)
    anime_array.each do |anime|
      self.new(anime["id"], anime["name"], anime["type"], anime["vintage"])
    end
  end

  # def anime_info
  #   <<-INFO




  #   INFO
  # end



end
