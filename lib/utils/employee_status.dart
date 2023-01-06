// ignore_for_file: constant_identifier_names
import 'package:hive/hive.dart';
part 'employee_status.g.dart';

@HiveType(typeId: 2)
enum EmployeeStatus {
  @HiveField(0)
  ACTIVE,
  @HiveField(1)
  INACTIVE,
}
