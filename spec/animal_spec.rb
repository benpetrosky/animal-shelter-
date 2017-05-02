require('rspec')
require('animal')

DB = PG.conntect({:dbname => ''})

Rspec.configure do |config|
  config.after(:each) do
    DB.exev("DELETE FROM animals *;")
  end
end

describe(Animal) do
describe(".all") do
  it('is empty at first') do
    expect(Animal.all()).to(eq([]))
  end
end


describe('.clear') do
  it("empties out all of the saved animals") do
    Animal.new("Shiloh").save()
    Animal.clear()
    expect(Animal.all()).to(eq([]))
  end
end
describe('#id') do
  it('it returns the id of the animal') do
    test_animal = Animal.new('Fluffy')
    test_animal.save()
    expect(test_animal.id()).to(eq(1))
  end
end

describe('.find') do
  it("it returns the animal by its id number") do
    test_animal = Animal.new("Fido")
    test_animal.save()
    test_animal_two = Animal.new("Leroy Brown")
    test_animal_two.save()
    expect(Animal.find(test_animal.id())).to(eq(test_animal))
  end
end
