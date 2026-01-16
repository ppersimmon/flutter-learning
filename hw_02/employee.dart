abstract class Employee {
    final String _name;
    final int _id;

    Employee({required String name, required int id})
    : _name = name,
      _id = id;

    factory Employee.create(String type, {required String name, required int id, required double salary}) {
      return switch (type) {
        'manager' => Manager(name: name, id: id, annualSalary: salary),
        'assistant'=> Assistant(name: name, id: id, hourlyRate: salary),
        _ => throw ('Unknown type of employee')
      };
    }

    String get name => _name;
    int get id => _id;

    String getEmployeeDetails() {
      return 'ID: $id, $name.';
    }

    String getMonthlyPay([double taxRate]);
}

mixin AnnualSalaryWorker on Employee{
    late double _annualSalary;

    double get annualSalary => _annualSalary;

    set annualSalary(double value) {
      assert(value > 0, 'Annual salary cannot be less that zero');
      _annualSalary = value;
    }

    String getMonthlyPay([double taxRate = 0.18]) {
      return (annualSalary / 12 * (1 - taxRate)).toStringAsFixed(2);
    }
}

mixin HourlyWageWorker on Employee{
    late double _hourlyRate;

    double get hourlyRate => _hourlyRate;

    set hourlyRate(double value) {
      assert(value > 0, 'Hourly rate cannot be less that zero');
      _hourlyRate = value;
    }

    String getMonthlyPay([double taxRate = 0.18]) {
      return (hourlyRate * 160 * (1 - taxRate)).toStringAsFixed(2);
    }
}

class Manager extends Employee with AnnualSalaryWorker {
  Manager({required super.name, required super.id, required double annualSalary}) {
        this._annualSalary = annualSalary;
    }

  @override
  String getEmployeeDetails() {
      return 'ID: $id, $name, annual salary: $annualSalary';
    }
}
class Assistant extends Employee with HourlyWageWorker {
  Assistant({required super.name, required super.id, required double hourlyRate}) {
        this._hourlyRate = hourlyRate;
    }
  
  @override
  String getEmployeeDetails() {
      return 'ID: $id, $name, hourly rate: $hourlyRate';
    }
}
