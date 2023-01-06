import 'dart:developer';

import 'package:hive/hive.dart';
import 'package:zylu_task/model/employee_model.dart';

class EmployeeDb {
  Future<void> addEmployee(EmployeeModel employee) async {
    try {
      final db = await Hive.openBox<EmployeeModel>('Employeee');
      await db.put(employee.id, employee);
    } catch (e) {
      log(e.toString());
    }
  }

  Future<List<EmployeeModel>?> getAllEmployees() async {
    try {
      final db = await Hive.openBox<EmployeeModel>('Employeee');
      final employees = db.values.toList();
      return employees;
    } catch (e) {
      log(e.toString());
    }
    return null;
  }

  Future<void> removeEmployee(String key) async {
    try {
      final db = await Hive.openBox<EmployeeModel>('Employeee');
      await db.delete(key);
    } catch (e) {
      log(e.toString());
    }
  }
}
