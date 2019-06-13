class Pokemon

    attr_accessor :name, :id, :type, :db, :hp
  
    def initialize(db, name = nil, type = nil, id = nil, hp = nil)
      @db = db
      @name = name
      @type = type
      @id = id
      @hp = hp
    end
  
  def self.save(name, type, db)
    db.execute("INSERT INTO pokemon (name, type) VALUES (?,?);", name, type)
  end
  
  def self.find(id, db)
    arr = db.execute("SELECT * FROM pokemon WHERE id = ?;", id)
    array = arr.flatten
    Pokemon.new(db, array[1], array[2], array[0], array[-1])
  end

  def alter_hp(newhp, db)
    db.execute("UPDATE pokemon SET hp = ? WHERE id = ?;", newhp , self.id)
  end

end
