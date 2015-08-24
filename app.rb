require('sinatra')
require('sinatra/reloader')
require ('sinatra/activerecord')
require('./lib/employee')
require('./lib/division')
also_reload('lib/**/*.rb')
require('pg')

get("/") do
	erb(:index)
end

get("/divisions") do
  @divisions = Division.all()
  erb(:divisions)
end

post('/divisions/new') do
  name = params.fetch('name')
  division = Division.new({:name =>name, :id => nil})
  division.save()
  @divisions = Division.all()
  erb(:divisions)
end

get('/employees') do
  @employees = Employee.all()
  @divisions = Division.all()
  erb(:employees)
end

post('/employees/new') do
  name = params.fetch('name')
  @divisions = Division.all()
  division_id = params.fetch('division_id')
  employee = Employee.new({:name =>name, :division_id => division_id, :id => nil})
  employee.save()
  @employees = Employee.all()
  erb(:employees)
end

get('/divisions/:id') do
  @divisions = Division.all()
  @division = Division.find(params.fetch("id").to_i)
   erb(:division)
end

patch("/divisions/:id") do
  name = params.fetch("name")
  @division = Division.find(params.fetch('id').to_i())
  @division.update({:name => name})
  @divisions = Division.all()
  @division = Division.find(params.fetch('id').to_i())
  erb(:division)
end

delete('/divisions/:id') do
  @division = Division.find(params.fetch('id').to_i())
  @division.delete()
  @divisions = Division.all()
  erb(:divisions)
end

get('/employees/:id') do
  @employees = Employee.all()
  @employee = Employee.find(params.fetch("id").to_i)
  @divisions = Division.all()
   erb(:employee)
end

patch("/employees/:id") do
  name = params.fetch("name")
  division_id = params.fetch("division_id")
  @divisions = Division.all()
  @employee = Employee.find(params.fetch('id').to_i())
  @employee.update({:name => name, :division_id => division_id})
  @employees = Employee.all()
  @divisions = Division.all()
  @employee = Employee.find(params.fetch('id').to_i())
  erb(:employee)
end

delete('/employees/:id') do
  @employee = Employee.find(params.fetch('id').to_i())
  @employee.delete()
  @employees = Employee.all()
  @divisions = Division.all
  erb(:employee)
end
