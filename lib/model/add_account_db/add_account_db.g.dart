// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'add_account_db.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class ProfileDbAdapter extends TypeAdapter<ProfileDb> {
  @override
  final int typeId = 1;

  @override
  ProfileDb read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return ProfileDb(
      id: fields[0] as int?,
      username: fields[1] as String,
      qualification: fields[2] as String,
      regestration: fields[3] as String,
      clinicname: fields[4] as String?,
      mobilenumber: fields[5] as String?,
      specialization: fields[6] as String?,
    );
  }

  @override
  void write(BinaryWriter writer, ProfileDb obj) {
    writer
      ..writeByte(7)
      ..writeByte(0)
      ..write(obj.id)
      ..writeByte(1)
      ..write(obj.username)
      ..writeByte(2)
      ..write(obj.qualification)
      ..writeByte(3)
      ..write(obj.regestration)
      ..writeByte(4)
      ..write(obj.clinicname)
      ..writeByte(5)
      ..write(obj.mobilenumber)
      ..writeByte(6)
      ..write(obj.specialization);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is ProfileDbAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
