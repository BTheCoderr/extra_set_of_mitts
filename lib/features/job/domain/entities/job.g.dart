// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'job.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class PaymentAdapter extends TypeAdapter<Payment> {
  @override
  final int typeId = 4;

  @override
  Payment read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return Payment(
      amount: fields[0] as double,
      status: fields[1] as String,
      hourlyRate: fields[2] as double,
      paidAt: fields[3] as DateTime?,
      transactionId: fields[4] as String?,
    );
  }

  @override
  void write(BinaryWriter writer, Payment obj) {
    writer
      ..writeByte(5)
      ..writeByte(0)
      ..write(obj.amount)
      ..writeByte(1)
      ..write(obj.status)
      ..writeByte(2)
      ..write(obj.hourlyRate)
      ..writeByte(3)
      ..write(obj.paidAt)
      ..writeByte(4)
      ..write(obj.transactionId);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is PaymentAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}

class RatingAdapter extends TypeAdapter<Rating> {
  @override
  final int typeId = 5;

  @override
  Rating read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return Rating(
      score: fields[0] as int,
      timestamp: fields[2] as DateTime,
      ratedBy: fields[3] as String,
      comment: fields[1] as String?,
    );
  }

  @override
  void write(BinaryWriter writer, Rating obj) {
    writer
      ..writeByte(4)
      ..writeByte(0)
      ..write(obj.score)
      ..writeByte(1)
      ..write(obj.comment)
      ..writeByte(2)
      ..write(obj.timestamp)
      ..writeByte(3)
      ..write(obj.ratedBy);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is RatingAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
