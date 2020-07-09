class AnimeList::Anime 

  attr_accessor :id, :title, :type, :date, :genre, :num_of_episodes, :plot_summary
  
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

  def anime_info
    <<-INFO

TITLE: #{self.title}

ANIME ID: #{self.id}

TYPE: #{self.type}          

DATE: #{self.date}

NUMBER OF EPISODES: #{self.num_of_episodes.join}

GENRE: #{self.genre.join(', ')}

PLOT SUMMARY:
#{self.plot_summary.join}               

    INFO
    
  end

  def self.all_anime
    all.map do |anime|
      "#{anime.id}: #{anime.title}"
    end
  end

end
