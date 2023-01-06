import 'package:flutter/material.dart';
import 'package:zylu_task/db/employee_db.dart';
import 'package:zylu_task/model/employee_model.dart';

class HomeController extends ChangeNotifier {
  HomeController() {
    getAllEmployees();
  }
  EmployeeDb employeeDb = EmployeeDb();
  List<EmployeeModel> employees = [];
  bool isLoading = false;
  void getAllEmployees() async {
    isLoading = true;
    notifyListeners();
    await employeeDb.getAllEmployees().then((value) {
      if (value != null) {
        employees = value;
      }
    });
    isLoading = false;
    notifyListeners();
  }

  void removeEmployee(BuildContext context, String key) async {
    await showDialog(
      context: context,
      builder: (ctx) => AlertDialog(
        title: const Text('Are you sure?'),
        content: const Text('Do you want to remove this employer?'),
        actions: [
          TextButton(
              onPressed: () {
                Navigator.of(ctx).pop();
              },
              child: const Text('No')),
          TextButton(
              onPressed: () async {
                await employeeDb.removeEmployee(key).then((value) {
                  getAllEmployees();
                  Navigator.of(ctx).pop();
                });
              },
              child: const Text('Yes'))
        ],
      ),
    );
  }
}
