// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'course_assignments.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class CourseAssignmentsAdapter extends TypeAdapter<CourseAssignments> {
  @override
  final int typeId = 2;

  @override
  CourseAssignments read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return CourseAssignments(
      courses: (fields[1] as List)?.cast<Course>(),
    );
  }

  @override
  void write(BinaryWriter writer, CourseAssignments obj) {
    writer
      ..writeByte(1)
      ..writeByte(1)
      ..write(obj.courses);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is CourseAssignmentsAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}

class CourseAdapter extends TypeAdapter<Course> {
  @override
  final int typeId = 3;

  @override
  Course read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return Course(
      id: fields[3] as int,
      fullname: fields[1] as String,
      shortname: fields[2] as String,
      timemodified: fields[4] as int,
      assignments: (fields[5] as List)?.cast<Assignment>(),
    );
  }

  @override
  void write(BinaryWriter writer, Course obj) {
    writer
      ..writeByte(5)
      ..writeByte(1)
      ..write(obj.fullname)
      ..writeByte(2)
      ..write(obj.shortname)
      ..writeByte(3)
      ..write(obj.id)
      ..writeByte(4)
      ..write(obj.timemodified)
      ..writeByte(5)
      ..write(obj.assignments);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is CourseAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}

class AssignmentAdapter extends TypeAdapter<Assignment> {
  @override
  final int typeId = 4;

  @override
  Assignment read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return Assignment(
      id: fields[1] as int,
      name: fields[2] as String,
      duedate: fields[3] as int,
    );
  }

  @override
  void write(BinaryWriter writer, Assignment obj) {
    writer
      ..writeByte(3)
      ..writeByte(1)
      ..write(obj.id)
      ..writeByte(2)
      ..write(obj.name)
      ..writeByte(3)
      ..write(obj.duedate);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is AssignmentAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
