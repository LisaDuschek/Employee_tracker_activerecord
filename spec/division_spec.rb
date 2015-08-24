require('spec_helper')

describe (Division) do

  describe('#employees') do
    it("tells which employees belong to a division") do
      test_division=Division.create({:name => "HR"})
      test_employee=Employee.create({:name => "Bob", :division_id => test_division.id()})
      test_employee2=Employee.create({:name => "Jim", :division_id => test_division.id()})
      expect(test_division.employees()).to(eq([test_employee, test_employee2]))
    end
  end
end
