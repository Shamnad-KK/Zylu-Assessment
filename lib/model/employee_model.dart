import 'package:hive/hive.dart';

import 'package:zylu_task/utils/employee_status.dart';
part 'employee_model.g.dart';

@HiveType(typeId: 1)
class EmployeeModel {
  @HiveField(0)
  final String id;
  @HiveField(1)
  final String name;
  @HiveField(2)
  final DateTime date;
  @HiveField(3)
  final EmployeeStatus status;
  @HiveField(4)
  final bool isExperienced;
  EmployeeModel({
    required this.id,
    required this.name,
    required this.date,
    required this.status,
    required this.isExperienced,
  });
}
