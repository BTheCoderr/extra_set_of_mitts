import 'package:hive/hive.dart';
import 'job.dart';

class JobAdapter extends TypeAdapter<Job> {
  @override
  final typeId = 0;

  @override
  Job read(BinaryReader reader) {
    return Job.fromJson(reader.readMap().cast());
  }

  @override
  void write(BinaryWriter writer, Job obj) {
    writer.writeMap(obj.toJson());
  }
}

class CleaningTaskAdapter extends TypeAdapter<CleaningTask> {
  @override
  final typeId = 1;

  @override
  CleaningTask read(BinaryReader reader) {
    return CleaningTask.fromJson(reader.readMap().cast());
  }

  @override
  void write(BinaryWriter writer, CleaningTask obj) {
    writer.writeMap(obj.toJson());
  }
}

class GeoLocationAdapter extends TypeAdapter<GeoLocation> {
  @override
  final typeId = 2;

  @override
  GeoLocation read(BinaryReader reader) {
    return GeoLocation.fromJson(reader.readMap().cast());
  }

  @override
  void write(BinaryWriter writer, GeoLocation obj) {
    writer.writeMap(obj.toJson());
  }
}

class JobStatusAdapter extends TypeAdapter<JobStatus> {
  @override
  final typeId = 3;

  @override
  JobStatus read(BinaryReader reader) {
    return JobStatus.values[reader.readInt()];
  }

  @override
  void write(BinaryWriter writer, JobStatus obj) {
    writer.writeInt(obj.index);
  }
}

class TaskTypeAdapter extends TypeAdapter<TaskType> {
  @override
  final typeId = 4;

  @override
  TaskType read(BinaryReader reader) {
    return TaskType.values[reader.readInt()];
  }

  @override
  void write(BinaryWriter writer, TaskType obj) {
    writer.writeInt(obj.index);
  }
} 