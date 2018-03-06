require "pry"

class Pokemon

  attr_accessor :name, :type, :db, :hp
  attr_reader :id

  def initialize(pokemon_attributes)
    @name = pokemon_attributes[:name]
    @id = pokemon_attributes[:id]
    @type = pokemon_attributes[:type]
    @db = pokemon_attributes[:db]
    @hp = pokemon_attributes[:hp]
  end

  def self.save(name, type, db)
    db.execute("INSERT INTO pokemon(name, type) VALUES (?, ?)", name, type)
  end

  def self.find(id, db)
    sql = "SELECT * FROM pokemon WHERE id = ?"
    result = db.execute(sql, id)[0]
    name = result[1]
    type = result[2]
    hp = result[3]
    new_ob = {name: name, id: id, type: type, hp: hp, db: db}
    p = Pokemon.new(new_ob)
    # binding.pry
  end

  def alter_hp(hp, db)
    sql = "UPDATE pokemon SET hp = ? WHERE id = ?"
    db.execute(sql, hp, self.id)
    # binding.pry
  end

end
