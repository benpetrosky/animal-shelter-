require("spec_helper")

describe(Animal) do

  describe(".all") do
    it('is empty at first') do
      expect(Animal.all()).to(eq([]))
    end
  end

  describe("#save") do
    it("adds an animal to the array of saved animals") do
      test_animal = Animal.new(({:animal_name => "Fido", :list_id => 1}))
      test_animal.save()
      expect(Animal.all()).to(eq([test_animal]))
    end
  end

  describe("#animal_name") do
    it("lets you read the animal name") do
      test_animal = Animal.new(({:animal_name => "Fido", :list_id => 1}))
      expect(test_animal.animal_name()).to(eq("Fido"))
    end
  end

  describe("#list_id") do
    it("lets you read the animal ID out") do
      test_animal = Animal.new({:animal_name => "Fido", :list_id => 1})
      expect(test_animal.list_id()).to(eq(1))
    end
  end

  describe("#==") do
    it("is the same animal if it has the same animal and list ID") do
      animal1 = Animal.new({:animal_name => "Fido", :list_id => 1})
      animal2 = Animal.new({:animal_name => "Fido", :list_id => 1})
      expect(animal1).to(eq(animal2))
    end
  end
end
