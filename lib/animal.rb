class Animal
  attr_reader(:animal_name, :list_id, :animal_gender, :animal_arrival_date, :type, :breed)

  define_method(:initialize) do |attributes|
    @animal_name = attributes.fetch(:animal_name)
    @list_id = attributes.fetch(:list_id)
    @animal_gender = attributes.fetch(:animal_gender)
    @animal_arrival_date = attributes.fetch(:animal_arrival_date)
    @type = attributes.fetch(:type)
    @breed = attributes.fetch(:breed)
  end

  define_singleton_method(:all) do
    returned_animals = DB.exec("SELECT * FROM animals;")
    animals = []
    returned_animals.each() do |animal|
      animal_name = animal.fetch("animal_name")
      animal_arrival_date = animal.fetch("animal_arrival_date")
      animal_gender = animal.fetch("animal_gender")
      type = animal.fetch("type")
      breed = animal.fetch("breed")
      list_id = animal.fetch("list_id").to_i() # The information comes out of the database as a string.
      animals.push(Animal.new({:animal_name => animal_name, :list_id => list_id, :breed => breed, :type => type, :animal_arrival_date => animal_arrival_date, :animal_gender => animal_gender}))
    end
    animals
  end

  define_method(:save) do
    DB.exec("INSERT INTO animals (animal_name, list_id, animal_gender, type, breed, animal_arrival_date) VALUES ('#{@animal_name}', #{@list_id}, '#{@animal_gender}', '#{@type}', '#{@breed}', '#{@animal_arrival_date}');")
  end


  define_method(:==) do |another_animal|
    self.animal_name().==(another_animal.animal_name()).&(self.list_id().==(another_animal.list_id()))
  end
end
