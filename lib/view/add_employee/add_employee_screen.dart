import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:zylu_task/controller/add_employee_controller.dart';
import 'package:zylu_task/controller/home_controller.dart';
import 'package:zylu_task/utils/employee_status.dart';

class AddEmployeeScreen extends StatelessWidget {
  const AddEmployeeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final addEmployeeController =
        Provider.of<AddEmployeeController>(context, listen: false);
    final homeController = Provider.of<HomeController>(context, listen: false);
    final formKey = GlobalKey<FormState>();
    return Scaffold(
      appBar: AppBar(),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Form(
          key: formKey,
          child: Column(
            children: [
              Consumer<AddEmployeeController>(
                builder: (context, value, child) => Row(
                  children: [
                    Expanded(
                        child: ListTile(
                      leading: Radio(
                        value: EmployeeStatus.ACTIVE,
                        groupValue: value.status,
                        onChanged: (newValue) {
                          value.onStatusChanged(newValue!);
                        },
                      ),
                      title: const Text('Active'),
                    )),
                    Expanded(
                        child: ListTile(
                      leading: Radio(
                        value: EmployeeStatus.INACTIVE,
                        groupValue: value.status,
                        onChanged: (newValue) {
                          value.onStatusChanged(newValue!);
                        },
                      ),
                      title: const Text('Inactive'),
                    )),
                  ],
                ),
              ),
              TextFormField(
                controller: addEmployeeController.nameController,
                validator: (value) =>
                    addEmployeeController.nameValidation(value),
                decoration: const InputDecoration(
                  border: OutlineInputBorder(),
                  isDense: true,
                  hintText: 'Employee Name',
                ),
              ),
              const SizedBox(height: 10),
              TextFormField(
                controller: addEmployeeController.dateController,
                validator: (value) =>
                    addEmployeeController.dateValidation(value),
                onTap: () {
                  addEmployeeController.showCalendar(context);
                },
                readOnly: true,
                decoration: const InputDecoration(
                  border: OutlineInputBorder(),
                  isDense: true,
                  hintText: 'Joining Date',
                  suffixIcon: Icon(Icons.calendar_month),
                ),
              ),
              const SizedBox(height: 10),
              ElevatedButton(
                onPressed: () {
                  if (formKey.currentState!.validate()) {
                    addEmployeeController.addEmployee(
                      context,
                      () {
                        homeController.getAllEmployees();
                      },
                    );
                  }
                },
                child: const Text('Add'),
              )
            ],
          ),
        ),
      ),
    );
  }
}
