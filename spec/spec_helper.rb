require("rspec")
require("pg")
require("animal")
require("animal_list")

DB = PG.connect({:dbname => "shelter_test"})

RSpec.configure do |config|
  config.after(:each) do
    DB.exec("DELETE FROM lists *;")
    DB.exec("DELETE FROM animals *;")
  end
end
