import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movie_app/config/routes/routes.dart';
import 'package:movie_app/src/features/auth_module/login/presentation/bloc/login_bloc.dart';

import 'config/routes/routes_name.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => LoginBloc(),
        ),
      ],
      child: const MaterialApp(
        debugShowCheckedModeBanner: false,
        initialRoute: RoutesName.splash,
        onGenerateRoute: Routes.generateRoute,
      ),
    );
  }
}

// import 'package:flutter/foundation.dart';
//
// /// Employee Class
// class Employee {
//   int id;
//   String name;
//   double _salary; // Private variable
//
//   /// Constructor
//   Employee(
//     this.id,
//     this.name,
//     this._salary,
//   );
//
//   /// Getter for salary
//   double get salary => _salary;
//
//   /// Setter for salary (validating minimum salary)
//   set salary(double value) {
//     if (value > 0) {
//       _salary = value;
//     } else {
//       if (kDebugMode) {
//         print("Salary cannot be negative or zero.");
//       }
//     }
//   }
//
//   /// Display employee details
//   void displayDetails() {
//     if (kDebugMode) {
//       print("ID: $id | Name: $name | Salary: \$$_salary");
//     }
//   }
//
//   /// Method to be overridden
//   double calculateBonus() {
//     return _salary * 0.1; // Default bonus is 10% of salary
//   }
// }
//
// /// Manager Class (Subclass of Employee)
// class Manager extends Employee {
//   String department;
//   int teamSize;
//
//   /// Constructor
//   Manager(
//     super.id,
//     super.name,
//     super.salary,
//     this.department,
//     this.teamSize,
//   );
//
//   /// Overriding calculateBonus (20% for managers)
//   @override
//   double calculateBonus() {
//     return salary * 0.2;
//   }
//
//   /// Method to assign a task
//   void assignTask(String task) {
//     if (kDebugMode) {
//       print("$name (Manager) is assigning task: $task");
//     }
//   }
//
//   /// Method to approve leave
//   void approveLeave(String employeeName) {
//     if (kDebugMode) {
//       print("$name approved leave for $employeeName.");
//     }
//   }
// }
//
// /// Developer Class (Subclass of Employee)
// class Developer extends Employee {
//   String programmingLanguage;
//   String experienceLevel;
//
//   /// Constructor
//   Developer(
//     super.id,
//     super.name,
//     super.salary,
//     this.programmingLanguage,
//     this.experienceLevel,
//   );
//
//   /// Overriding calculateBonus (15% for developers)
//   @override
//   double calculateBonus() {
//     return salary * 0.15;
//   }
//
//   /// Developer writing code
//   void writeCode() {
//     if (kDebugMode) {
//       print("$name is coding in $programmingLanguage.");
//     }
//   }
//
//   /// Developer debugging code
//   void debugCode() {
//     if (kDebugMode) {
//       print("$name is debugging code.");
//     }
//   }
// }
//
// /// Company Class to track employees
// class Company {
//   static List<Employee> employees = []; // Static list to hold employees
//
//   /// Method to add an employee
//   static void addEmployee(Employee employee) {
//     employees.add(employee);
//     if (kDebugMode) {
//       print("${employee.name} added to the company.");
//     }
//   }
//
//   /// Method to update an employee's name and salary
//   static void updateEmployee(int id, String name, double salary) {
//     var employee = employees.firstWhere(
//       (e) => e.id == id,
//     );
//     employee.name = name;
//     employee.salary = salary;
//     if (kDebugMode) {
//       print("Employee with ID $id updated.");
//     }
//   }
//
//   /// Method to update a developer's programming language and experience level
//   static void updateDeveloperSkills(
//       int id, String programmingLanguage, String experienceLevel) {
//     var employee = employees.firstWhere(
//       (e) => e.id == id,
//     );
//
//     if (employee is Developer) {
//       employee.programmingLanguage = programmingLanguage;
//       employee.experienceLevel = experienceLevel;
//       if (kDebugMode) {
//         print(
//             "Developer with ID $id updated: New skills -> $programmingLanguage, $experienceLevel");
//       }
//     } else {
//       if (kDebugMode) {
//         print("Employee with ID $id is not a developer.");
//       }
//     }
//   }
//
//   /// Method to delete an employee
//   static void deleteEmployee(int id) {
//     var employee = employees.firstWhere(
//       (e) => e.id == id,
//     );
//     employees.remove(employee);
//     if (kDebugMode) {
//       print("Employee with ID $id deleted.");
//     }
//   }
//
//   /// Method to search an employee by ID
//   static Employee searchEmployee(int id) {
//     return employees.firstWhere(
//       (e) => e.id == id,
//     );
//   }
//
//   /// Method to display all employees, separating Managers and Developers
//   static void displayAllEmployees() {
//     if (employees.isEmpty) {
//       if (kDebugMode) {
//         print("No employees to display.");
//       }
//       return;
//     }
//
//     // Separate Managers and Developers
//     List<Manager> managers = employees.whereType<Manager>().toList();
//     List<Developer> developers = employees.whereType<Developer>().toList();
//
//     if (managers.isNotEmpty) {
//       if (kDebugMode) {
//         print("\n===== Managers =====");
//       }
//       for (var manager in managers) {
//         manager.displayDetails();
//         if (kDebugMode) {
//           print(
//               "Department: ${manager.department} | Team Size: ${manager.teamSize}");
//         }
//       }
//     }
//
//     if (developers.isNotEmpty) {
//       if (kDebugMode) {
//         print("\n===== Developers =====");
//       }
//       for (var dev in developers) {
//         dev.displayDetails();
//         if (kDebugMode) {
//           print(
//               "Programming Language: ${dev.programmingLanguage} | Experience Level: ${dev.experienceLevel}");
//         }
//       }
//     }
//   }
// }
//
// void main() {
//   /// Add some employees
//   Company.addEmployee(Manager(101, "Alice", 5000, "IT", 5));
//   Company.addEmployee(Developer(102, "Bob", 4000, "Dart", "Mid-Level"));
//
//   /// Display all employees
//   print("All Employees:");
//   Company.displayAllEmployees();
//
//   /// Update employee
//   Company.updateEmployee(102, "Bob", 4500);
//   print("\nAfter updating Bob's salary:");
//   Company.displayAllEmployees();
//
//   /// Update developer skills
//   Company.updateDeveloperSkills(102, "Flutter", "Senior");
//   print("\nAfter updating Bob's skills:");
//   Company.displayAllEmployees();
//
//   /// Search employee by ID
//   print("\nSearching for employee with ID 102:");
//   Employee employee = Company.searchEmployee(102);
//   employee.displayDetails();
//   if (employee is Developer) {
//     if (kDebugMode) {
//       print(
//           "Programming Language: ${employee.programmingLanguage} | Experience Level: ${employee.experienceLevel}");
//     }
//   }
//
//   /// Delete an employee
//   Company.deleteEmployee(101);
//   print("\nAfter deleting Alice:");
//   Company.displayAllEmployees();
// }
