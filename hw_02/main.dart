import 'employee.dart';

void main() {

final employee1 = Employee.create('manager', name: 'John Doe', id: 1, salary: 70000);
final employee2 = Employee.create('assistant', name: 'John Smith', id: 2, salary: 15);

print(employee1.getEmployeeDetails());
print(employee2.getEmployeeDetails());

print(employee1.getMonthlyPay());
print(employee2.getMonthlyPay());

// List
var teamList = [employee1, employee2];
teamList.forEach((worker) => print(worker.getEmployeeDetails()));

// Map
var teamMap = {
  employee1.id : employee1,
  employee2.id : employee2,
  };

print(teamMap[2]?.name);
print(teamMap[3]?.name);

// Set
Set<String> roles = {};
teamList.forEach((worker) => roles.add(worker.runtimeType.toString()));
print(roles);
}
