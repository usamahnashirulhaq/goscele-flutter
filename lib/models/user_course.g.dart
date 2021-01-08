// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user_course.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class UserCourseAdapter extends TypeAdapter<UserCourse> {
  @override
  final int typeId = 1;

  @override
  UserCourse read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return UserCourse(
      id: fields[1] as int,
      shortname: fields[2] as String,
      fullname: fields[3] as String,
      enrolledusercount: fields[4] as int,
      idnumber: fields[5] as String,
      visible: fields[6] as int,
      summary: fields[7] as String,
      summaryformat: fields[8] as int,
      format: fields[9] as String,
      showgrades: fields[10] as bool,
      lang: fields[11] as String,
      enablecompletion: fields[12] as bool,
      category: fields[13] as int,
      progress: fields[14] as dynamic,
      startdate: fields[15] as int,
      enddate: fields[16] as int,
    );
  }

  @override
  void write(BinaryWriter writer, UserCourse obj) {
    writer
      ..writeByte(16)
      ..writeByte(1)
      ..write(obj.id)
      ..writeByte(2)
      ..write(obj.shortname)
      ..writeByte(3)
      ..write(obj.fullname)
      ..writeByte(4)
      ..write(obj.enrolledusercount)
      ..writeByte(5)
      ..write(obj.idnumber)
      ..writeByte(6)
      ..write(obj.visible)
      ..writeByte(7)
      ..write(obj.summary)
      ..writeByte(8)
      ..write(obj.summaryformat)
      ..writeByte(9)
      ..write(obj.format)
      ..writeByte(10)
      ..write(obj.showgrades)
      ..writeByte(11)
      ..write(obj.lang)
      ..writeByte(12)
      ..write(obj.enablecompletion)
      ..writeByte(13)
      ..write(obj.category)
      ..writeByte(14)
      ..write(obj.progress)
      ..writeByte(15)
      ..write(obj.startdate)
      ..writeByte(16)
      ..write(obj.enddate);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is UserCourseAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
