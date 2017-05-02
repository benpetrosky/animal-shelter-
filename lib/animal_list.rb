
class Animal_List
  attr_reader(:animal_name, :id, :breed)

  define_method(:initialize) do |attributes|
    @animal_name = attributes.fetch(:animal_name)
    @id = attributes.fetch(:id)
  end

  define_singleton_method(:all) do
    returned_lists = DB.exec("SELECT * FROM lists;")
    lists = []
    returned_lists.each() do |list|
      animal_name = list.fetch("animal_name")
      id = list.fetch("id").to_i()
      lists.push(Animal_List.new({:animal_name => animal_name, :id => id}))
    end
    lists
  end

  define_method(:save) do
    result = DB.exec("INSERT INTO lists (animal_name) VALUES ('#{@animal_name}') RETURNING id;")
    @id = result.first().fetch("id").to_i()
  end

  define_method(:==) do |another_list|
    self.animal_name().==(another_list.animal_name()).&(self.id().==(another_list.id()))
  end
end
