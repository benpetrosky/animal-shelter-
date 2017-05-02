
class Animal
  attr_reader(:animal_name, :id)

  define_method(:initialize) do |attributes|
    @animal_name = attributes.fetch(:animal_name)
    @id = attributes.fetch(:id)
  end

  define_singleton_method(:all) do
    returned_animals = DB.exec("SELECT * FROM tasks;")
    all_animals = []
    returned_animals.each() do |animal|
      animal_name = animal.fetch("animal_name")
      animal_name.push(Animal.new({:animal_name => animal_name, :id => id}))
  end
  all_animals
end


  #
  # define_singleton_method(:find) do |identification|
  #   found_animal = nil
  #   @@all_animals.each() do |animal|
  #     if animal.id().eql?(identification.to_i())
  #       found_animal = animal
  #     end
  #   end
  #   found_animal
  #   end

    define_method(:save) do
      DB.exec("INSERT INTO all_animals (animal_name) VALUES ('#{@animal_name}') RETURNING id;")
      @id = result.first().fetch("id").to_i()
    end

    define_method(:==) do |another_animal|
      self.animal_name().==(another_animal.animal_name()).&(self.id().== (another_animal.id()))
    end
  end
