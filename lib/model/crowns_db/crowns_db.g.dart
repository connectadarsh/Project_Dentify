// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'crowns_db.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class CrownsDbAdapter extends TypeAdapter<CrownsDb> {
  @override
  final int typeId = 3;

  @override
  CrownsDb read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return CrownsDb(
      id: fields[0] as int?,
      image: fields[1] as String,
    );
  }

  @override
  void write(BinaryWriter writer, CrownsDb obj) {
    writer
      ..writeByte(2)
      ..writeByte(0)
      ..write(obj.id)
      ..writeByte(1)
      ..write(obj.image);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is CrownsDbAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
