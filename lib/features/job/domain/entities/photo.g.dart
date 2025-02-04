// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'photo.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class PhotoAdapter extends TypeAdapter<Photo> {
  @override
  final int typeId = 2;

  @override
  Photo read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return Photo(
      id: fields[0] as String,
      url: fields[1] as String,
      type: fields[2] as String,
      timestamp: fields[3] as DateTime,
      uploadedBy: fields[7] as String,
      variants: (fields[4] as Map?)?.cast<String, String>(),
      notes: fields[5] as String?,
      metadata: (fields[6] as Map?)?.cast<String, dynamic>(),
    );
  }

  @override
  void write(BinaryWriter writer, Photo obj) {
    writer
      ..writeByte(8)
      ..writeByte(0)
      ..write(obj.id)
      ..writeByte(1)
      ..write(obj.url)
      ..writeByte(2)
      ..write(obj.type)
      ..writeByte(3)
      ..write(obj.timestamp)
      ..writeByte(4)
      ..write(obj.variants)
      ..writeByte(5)
      ..write(obj.notes)
      ..writeByte(6)
      ..write(obj.metadata)
      ..writeByte(7)
      ..write(obj.uploadedBy);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is PhotoAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
