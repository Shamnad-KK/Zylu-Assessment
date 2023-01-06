import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:zylu_task/db/employee_db.dart';
import 'package:zylu_task/model/employee_model.dart';
import 'package:zylu_task/utils/employee_status.dart';

class AddEmployeeController extends ChangeNotifier {
  EmployeeStatus status = EmployeeStatus.ACTIVE;
  DateTime? pickedDate;
  EmployeeDb employeeDb = EmployeeDb();
  final nameController = TextEditingController();
  final dateController = TextEditingController();
  bool experienced = false;

  void addEmployee(BuildContext context, VoidCallback onAdded) async {
    if (pickedDate != null) {
      Duration duration = DateTime.now().difference(pickedDate!);
      if (duration.inDays >= 1825) {
        experienced = true;
        log("Experience with these days: ${duration.inDays.toString()}");
        notifyListeners();
      }
    }
    final employee = EmployeeModel(
      id: DateTime.now().millisecondsSinceEpoch.toString(),
      name: nameController.text,
      date: pickedDate!,
      status: status,
      isExperienced: experienced,
    );
    await employeeDb.addEmployee(employee).then((value) {
      onAdded();
      Navigator.of(context).pop();
    });
  }

  void onStatusChanged(EmployeeStatus newStatus) {
    status = newStatus;
    notifyListeners();
  }

  void showCalendar(BuildContext context) async {
    DateTime? result = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(1990),
      lastDate: DateTime.now(),
    );
    if (result != null) {
      pickedDate = result;
      dateController.text = pickedDate.toString();
      notifyListeners();
    }
  }

  String? nameValidation(String? value) {
    if (value!.isEmpty) {
      return 'Please enter a name';
    }
    return null;
  }

  String? dateValidation(String? value) {
    if (value!.isEmpty) {
      return 'Please pick a date';
    }
    return null;
  }
}
