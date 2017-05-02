require("spec_helper")

describe(Animal_List) do
  describe(".all") do
    it("starts off with no lists") do
      expect(Animal_List.all()).to(eq([]))
    end
  end

  describe("#animal_name") do
    it("tells you its name") do
      list = Animal_List.new({:animal_name => "Fido", :id => nil})
      expect(list.animal_name()).to(eq("Fido"))
    end
  end

  describe("#id") do
    it("sets its ID when you save it") do
      list = Animal_List.new({:animal_name => "Fido", :id => nil})
      list.save()
      expect(list.id()).to(be_an_instance_of(Fixnum))
    end
  end

  describe("#save") do
    it("lets you save lists to the database") do
      list = Animal_List.new({:animal_name => "Fido", :id => nil})
      list.save()
      expect(Animal_List.all()).to(eq([list]))
    end
  end

  describe("#==") do
    it("is the same list if it has the same animal_name") do
      list1 = Animal_List.new({:animal_name => "Fido", :id => nil})
      list2 = Animal_List.new({:animal_name => "Fido", :id => nil})
      expect(list1).to(eq(list2))
    end
  end
end
