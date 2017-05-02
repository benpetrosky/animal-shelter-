require("rspec")
require("pg")
require("animal")
require("")

DB = PG.connect({:dbname => ""})

RSpec.configure do |config|
  config.after(:each) do
    DB.exec("DELETE FROM lists *;")
    DB.exec("DELETE FROM tasks *;")
  end
end
