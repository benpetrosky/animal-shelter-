class Animal
  attr_reader(:animal_name, :list_id)

  define_method(:initialize) do |attributes|
    @animal_name = attributes.fetch(:animal_name)
    @list_id = attributes.fetch(:list_id)
  end

  define_singleton_method(:all) do
    returned_animals = DB.exec("SELECT * FROM animals;")
    animals = []
    returned_animals.each() do |animal|
      animal_name = animal.fetch("animal_name")
      list_id = animal.fetch("list_id").to_i() # The information comes out of the database as a string.
      animals.push(Animal.new({:animal_name => animal_name, :list_id => list_id}))
    end
    animals
  end

  define_method(:save) do
    DB.exec("INSERT INTO animals (animal_name, list_id) VALUES ('#{@animal_name}', #{@list_id});")
  end

  define_method(:==) do |another_animal|
    self.animal_name().==(another_animal.animal_name()).&(self.list_id().==(another_animal.list_id()))
  end
end
