// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'appointment_db.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class AppointmentDbAdapter extends TypeAdapter<AppointmentDb> {
  @override
  final int typeId = 4;

  @override
  AppointmentDb read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return AppointmentDb(
      id: fields[0] as int?,
      patientName: fields[1] as String,
      mobileNumber: fields[2] as String,
      city: fields[3] as String,
      date: fields[4] as String,
      time: fields[5] as String,
    );
  }

  @override
  void write(BinaryWriter writer, AppointmentDb obj) {
    writer
      ..writeByte(6)
      ..writeByte(0)
      ..write(obj.id)
      ..writeByte(1)
      ..write(obj.patientName)
      ..writeByte(2)
      ..write(obj.mobileNumber)
      ..writeByte(3)
      ..write(obj.city)
      ..writeByte(4)
      ..write(obj.date)
      ..writeByte(5)
      ..write(obj.time);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is AppointmentDbAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
