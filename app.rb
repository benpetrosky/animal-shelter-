require("sinatra")
require("sinatra/reloader")
also_reload("lib/**/*.rb")
require("./lib/animal")
require("pg")

DB = PG.connect({:dbname => "shelter"})

get("/") do
  @animals = Animal.all()
  erb(:index)
end

post("/animals") do
  animal_name = params.fetch('animal_name')
  animal_gender = params.fetch('animal_gender')
  animal_arrival_date = params.fetch('animal_arrival_date')
  type = params.fetch('type')
  breed = params.fetch("breed")
  animal = Animal.new({:animal_name => animal_name,:animal_arrival_date => animal_arrival_date, :type => type, :breed => breed, :animal_gender => animal_gender})
  animal.save()
  erb(:success)
end
