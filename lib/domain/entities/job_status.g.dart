// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'job_status.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class JobStatusAdapter extends TypeAdapter<JobStatus> {
  @override
  final int typeId = 3;

  @override
  JobStatus read(BinaryReader reader) {
    switch (reader.readByte()) {
      case 0:
        return JobStatus.pending;
      case 1:
        return JobStatus.inProgress;
      case 2:
        return JobStatus.completed;
      case 3:
        return JobStatus.cancelled;
      case 4:
        return JobStatus.delayed;
      default:
        return JobStatus.pending;
    }
  }

  @override
  void write(BinaryWriter writer, JobStatus obj) {
    switch (obj) {
      case JobStatus.pending:
        writer.writeByte(0);
        break;
      case JobStatus.inProgress:
        writer.writeByte(1);
        break;
      case JobStatus.completed:
        writer.writeByte(2);
        break;
      case JobStatus.cancelled:
        writer.writeByte(3);
        break;
      case JobStatus.delayed:
        writer.writeByte(4);
        break;
    }
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is JobStatusAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
