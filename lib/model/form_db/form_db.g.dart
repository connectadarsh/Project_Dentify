// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'form_db.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class FormDbAdapter extends TypeAdapter<FormDb> {
  @override
  final int typeId = 5;

  @override
  FormDb read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return FormDb(
      id: fields[0] as int?,
      name: fields[1] as String,
      age: fields[2] as String,
      gender: fields[3] as String,
      address: fields[4] as String,
      medicalHistory: fields[5] as String,
      dentalHistory: fields[6] as String,
      diet: fields[7] as String,
      tobacco: fields[8] as String,
      oral: fields[9] as String,
      chief: fields[10] as String,
      mobile: fields[11] as String,
      date: fields[12] as String,
      time: fields[13] as String,
    );
  }

  @override
  void write(BinaryWriter writer, FormDb obj) {
    writer
      ..writeByte(14)
      ..writeByte(0)
      ..write(obj.id)
      ..writeByte(1)
      ..write(obj.name)
      ..writeByte(2)
      ..write(obj.age)
      ..writeByte(3)
      ..write(obj.gender)
      ..writeByte(4)
      ..write(obj.address)
      ..writeByte(5)
      ..write(obj.medicalHistory)
      ..writeByte(6)
      ..write(obj.dentalHistory)
      ..writeByte(7)
      ..write(obj.diet)
      ..writeByte(8)
      ..write(obj.tobacco)
      ..writeByte(9)
      ..write(obj.oral)
      ..writeByte(10)
      ..write(obj.chief)
      ..writeByte(11)
      ..write(obj.mobile)
      ..writeByte(12)
      ..write(obj.date)
      ..writeByte(13)
      ..write(obj.time);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is FormDbAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
