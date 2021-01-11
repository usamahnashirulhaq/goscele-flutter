// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'course_category.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class CourseCategoryAdapter extends TypeAdapter<CourseCategory> {
  @override
  final int typeId = 5;

  @override
  CourseCategory read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return CourseCategory(
      id: fields[1] as int,
      name: fields[2] as String,
    );
  }

  @override
  void write(BinaryWriter writer, CourseCategory obj) {
    writer
      ..writeByte(2)
      ..writeByte(1)
      ..write(obj.id)
      ..writeByte(2)
      ..write(obj.name);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is CourseCategoryAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
