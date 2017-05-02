require("sinatra")
require("sinatra/reloader")
also_reload("lib/**/*.rb")
require("./lib/animal")
require("pg")

DB = PG.connect({:dbname => "animal"})

get("/") do
  @animals = Animal.all()
  erb(:index)
end

post("/animals") do
  animal_name = params.fetch('animal_name')
  animal = Animal.new({:animal_name => animal_name})
  animal.save()
  erb(:success)
end
