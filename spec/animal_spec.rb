require("spec_helper")

describe(Animal) do

  describe(".all") do
    it('is empty at first') do
      expect(Animal.all()).to(eq([]))
    end
  end

  describe("#save") do
    it("adds an animal to the array of saved animals") do
      test_animal = Animal.new(({:animal_name => "Fido", :list_id => 1, :animal_gender => "male", :type => "dog", :breed => "lab", :animal_arrival_date => "05/02/2017"}))
      test_animal.save()
      expect(Animal.all()).to(eq([test_animal]))
    end
  end

  describe("#animal_name") do
    it("lets you read the animal name") do
      test_animal = Animal.new(({:animal_name => "Fido", :list_id => 1, :animal_gender => "male", :type => "dog", :breed => "lab", :animal_arrival_date => "05/02/2017"}))
      expect(test_animal.animal_name()).to(eq("Fido"))
    end
  end

  describe("#animal_gender") do
    it("lets you read the animals gender") do
      test_animal = Animal.new(({:animal_name => "Fido", :list_id => 1, :animal_gender => "male", :type => "dog", :breed => "lab", :animal_arrival_date => "05/02/2017"}))
      expect(test_animal.animal_gender()).to(eq("male"))
    end
  end

  describe("#animal_arrival_date") do
    it("tells you when the animal arrived at the shelter") do
      test_animal = Animal.new(({:animal_name => "Fido", :list_id => 1, :animal_gender => "male", :type => "dog", :breed => "lab", :animal_arrival_date => "05/02/2017"}))
      expect(test_animal.animal_arrival_date()).to(eq("05/02/2017"))
    end
  end

  describe("#type") do
    it("lets you read the type of animal ie dog, cat, lizard, etc.") do
      test_animal = Animal.new(({:animal_name => "Fido", :list_id => 1, :animal_gender => "male", :type => "dog", :breed => "lab", :animal_arrival_date => "05/02/2017"}))
      expect(test_animal.type()).to(eq("dog"))
    end
  end

  describe("#breed") do
    it("lets you read the animal name") do
      test_animal = Animal.new(({:animal_name => "Fido", :list_id => 1, :animal_gender => "male", :type => "dog", :breed => "lab", :animal_arrival_date => "05/02/2017"}))
      expect(test_animal.breed()).to(eq("lab"))
    end
  end


  describe("#list_id") do
    it("lets you read the animal ID out") do
      test_animal = Animal.new({:animal_name => "Fido", :list_id => 1, :animal_gender => "male", :type => "dog", :breed => "lab", :animal_arrival_date => "05/02/2017"})
      expect(test_animal.list_id()).to(eq(1))
    end
  end

  describe("#==") do
    it("is the same animal if it has the same animal and list ID") do
      animal1 = Animal.new({:animal_name => "Fido", :list_id => 1, :animal_gender => "male", :type => "dog", :breed => "lab", :animal_arrival_date => "05/02/2017"})
      animal2 = Animal.new({:animal_name => "Fido", :list_id => 1, :animal_gender => "male", :type => "dog", :breed => "lab", :animal_arrival_date => "05/02/2017"})
      expect(animal1).to(eq(animal2))
    end
  end
end
