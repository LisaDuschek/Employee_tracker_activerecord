ENV ['RACK_ENV'] ='test'


require("rspec")
require("pg")
require("sinatra/activerecord")
require("employee")
require("division")
require("pry")



RSpec.configure do |config|
	config.after(:each) do
	   Employee.all().each() do |employee|
		employee.destroy()
	end
end
  config.after(:each) do
     Division.all().each() do |division|
    division.destroy()
  end
end

end
