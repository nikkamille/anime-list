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


end
