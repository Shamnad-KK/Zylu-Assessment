import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';
import 'package:zylu_task/controller/home_controller.dart';
import 'package:zylu_task/utils/employee_status.dart';
import 'package:zylu_task/view/add_employee/add_employee_screen.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Consumer<HomeController>(
        builder: (context, value, child) {
          if (value.isLoading) {
            return const Center(
              child: CircularProgressIndicator(strokeWidth: 2),
            );
          }
          if (value.employees.isEmpty) {
            return const Center(
              child: Text('Employee list is empty, Please add one'),
            );
          }
          return ListView.separated(
            itemCount: value.employees.length,
            shrinkWrap: true,
            padding: const EdgeInsets.all(10),
            itemBuilder: (context, index) {
              final employee = value.employees[index];
              final textStyle = TextStyle(
                color: employee.isExperienced &&
                        employee.status == EmployeeStatus.ACTIVE
                    ? Colors.white
                    : Colors.black,
              );
              return ListTile(
                tileColor: employee.isExperienced &&
                        employee.status == EmployeeStatus.ACTIVE
                    ? Colors.green
                    : null,
                title: Text(
                  employee.name,
                  style: textStyle,
                ),
                subtitle: Text(
                  "${DateFormat.yMMMMd().format(employee.date)} - ${employee.status.name}",
                  style: textStyle,
                ),
                trailing: IconButton(
                  onPressed: () {
                    value.removeEmployee(context, employee.id);
                  },
                  icon: const Icon(Icons.delete),
                ),
              );
            },
            separatorBuilder: (context, index) => const SizedBox(height: 20),
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.of(context).push(MaterialPageRoute(
            builder: (context) => const AddEmployeeScreen(),
          ));
        },
        child: const Icon(Icons.add),
      ),
    );
  }
}
