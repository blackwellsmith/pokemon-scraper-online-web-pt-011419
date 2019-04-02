require "pry"
class Pokemon
  attr_accessor :id ,:name, :type, :hp, :db
  @@all = []
  
  def initialize(id:,name:,type:,hp: nil, db:)
    @id = id
    @name = name 
    @type = type
    @db = db
    @hp = hp
    @@all << self
  end
  def self.find(number, db)
    pokemon_by_id = db.execute("SELECT * FROM pokemon WHERE id = ?", [number]).flatten
   Pokemon.new(id: pokemon_by_id[0],name: pokemon_by_id[1],type: pokemon_by_id[2],db:db)
  end
  
  def self.save(name, type, db)
    db.execute("INSERT INTO pokemon (name, type) VALUES (?, ?)",name, type)
  end
end