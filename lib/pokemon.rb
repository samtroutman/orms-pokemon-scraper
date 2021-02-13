class Pokemon
    attr_accessor :name, :type, :id, :db

    def initialize(name:, type:, id:, db:)
       @name = name
       @type = type
       @id = id
       @db = db
    end

    def self.save(name, type, db)
        db.execute("INSERT INTO pokemon (name, type) VALUES (?, ?)", name, type)
    end

    def self.find(id, db)
        new_pokemon = db.execute("SELECT * FROM pokemon WHERE id=?", id).flatten
        Pokemon.new(id: new_pokemon[0], name: new_pokemon[1], type: new_pokemon[2], db:db)
    end

end
