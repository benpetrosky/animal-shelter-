require("sinatra")
require("sinatra/reloader")
also_reload("lib/**/*.rb")
require("./lib/animal")
require("pg")

DB = PG.connect({:dbname => "animal"})
