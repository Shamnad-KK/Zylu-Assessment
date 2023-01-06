// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'employee_status.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class EmployeeStatusAdapter extends TypeAdapter<EmployeeStatus> {
  @override
  final int typeId = 2;

  @override
  EmployeeStatus read(BinaryReader reader) {
    switch (reader.readByte()) {
      case 0:
        return EmployeeStatus.ACTIVE;
      case 1:
        return EmployeeStatus.INACTIVE;
      default:
        return EmployeeStatus.ACTIVE;
    }
  }

  @override
  void write(BinaryWriter writer, EmployeeStatus obj) {
    switch (obj) {
      case EmployeeStatus.ACTIVE:
        writer.writeByte(0);
        break;
      case EmployeeStatus.INACTIVE:
        writer.writeByte(1);
        break;
    }
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is EmployeeStatusAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
