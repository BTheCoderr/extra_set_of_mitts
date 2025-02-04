// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'job.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class JobModelAdapter extends TypeAdapter<JobModel> {
  @override
  final int typeId = 8;

  @override
  JobModel read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return JobModel(
      id: fields[0] as String,
      customerId: fields[1] as String,
      customerName: fields[2] as String,
      address: fields[3] as String,
      scheduledStartTime: fields[4] as DateTime,
      scheduledEndTime: fields[5] as DateTime,
      assignedContractors: (fields[6] as List).cast<String>(),
      status: fields[7] as JobStatus,
      tasks: (fields[8] as List).cast<CleaningTask>(),
      notes: fields[9] as String?,
      actualStartTime: fields[10] as DateTime?,
      actualEndTime: fields[11] as DateTime?,
      photosRequired: fields[12] as bool,
      location: fields[13] as GeoLocation?,
      createdAt: fields[14] as DateTime,
      completedAt: fields[15] as DateTime?,
    );
  }

  @override
  void write(BinaryWriter writer, JobModel obj) {
    writer
      ..writeByte(16)
      ..writeByte(0)
      ..write(obj.id)
      ..writeByte(1)
      ..write(obj.customerId)
      ..writeByte(2)
      ..write(obj.customerName)
      ..writeByte(3)
      ..write(obj.address)
      ..writeByte(4)
      ..write(obj.scheduledStartTime)
      ..writeByte(5)
      ..write(obj.scheduledEndTime)
      ..writeByte(6)
      ..write(obj.assignedContractors)
      ..writeByte(7)
      ..write(obj.status)
      ..writeByte(8)
      ..write(obj.tasks)
      ..writeByte(9)
      ..write(obj.notes)
      ..writeByte(10)
      ..write(obj.actualStartTime)
      ..writeByte(11)
      ..write(obj.actualEndTime)
      ..writeByte(12)
      ..write(obj.photosRequired)
      ..writeByte(13)
      ..write(obj.location)
      ..writeByte(14)
      ..write(obj.createdAt)
      ..writeByte(15)
      ..write(obj.completedAt);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is JobModelAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}

class CleaningTaskAdapter extends TypeAdapter<CleaningTask> {
  @override
  final int typeId = 9;

  @override
  CleaningTask read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return CleaningTask(
      id: fields[0] as String,
      title: fields[1] as String,
      description: fields[2] as String,
      isCompleted: fields[3] as bool,
      completedBy: fields[4] as String?,
      completedAt: fields[5] as DateTime?,
      photoUrls: (fields[6] as List?)?.cast<String>(),
      pendingPhotos: (fields[7] as List?)?.cast<String>(),
    );
  }

  @override
  void write(BinaryWriter writer, CleaningTask obj) {
    writer
      ..writeByte(8)
      ..writeByte(0)
      ..write(obj.id)
      ..writeByte(1)
      ..write(obj.title)
      ..writeByte(2)
      ..write(obj.description)
      ..writeByte(3)
      ..write(obj.isCompleted)
      ..writeByte(4)
      ..write(obj.completedBy)
      ..writeByte(5)
      ..write(obj.completedAt)
      ..writeByte(6)
      ..write(obj.photoUrls)
      ..writeByte(7)
      ..write(obj.pendingPhotos);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is CleaningTaskAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}

class TaskTypeAdapter extends TypeAdapter<TaskType> {
  @override
  final int typeId = 2;

  @override
  TaskType read(BinaryReader reader) {
    switch (reader.readByte()) {
      case 0:
        return TaskType.general;
      default:
        return TaskType.general;
    }
  }

  @override
  void write(BinaryWriter writer, TaskType obj) {
    switch (obj) {
      case TaskType.general:
        writer.writeByte(0);
        break;
    }
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is TaskTypeAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$JobModelImpl _$$JobModelImplFromJson(Map<String, dynamic> json) =>
    _$JobModelImpl(
      id: json['id'] as String,
      customerId: json['customerId'] as String,
      customerName: json['customerName'] as String,
      address: json['address'] as String,
      scheduledStartTime: DateTime.parse(json['scheduledStartTime'] as String),
      scheduledEndTime: DateTime.parse(json['scheduledEndTime'] as String),
      assignedContractors: (json['assignedContractors'] as List<dynamic>)
          .map((e) => e as String)
          .toList(),
      status: $enumDecode(_$JobStatusEnumMap, json['status']),
      tasks: (json['tasks'] as List<dynamic>?)
              ?.map((e) => CleaningTask.fromJson(e as Map<String, dynamic>))
              .toList() ??
          const [],
      notes: json['notes'] as String?,
      actualStartTime: json['actualStartTime'] == null
          ? null
          : DateTime.parse(json['actualStartTime'] as String),
      actualEndTime: json['actualEndTime'] == null
          ? null
          : DateTime.parse(json['actualEndTime'] as String),
      photosRequired: json['photosRequired'] as bool? ?? false,
      location: json['location'] == null
          ? null
          : GeoLocation.fromJson(json['location'] as Map<String, dynamic>),
      createdAt: DateTime.parse(json['createdAt'] as String),
      completedAt: json['completedAt'] == null
          ? null
          : DateTime.parse(json['completedAt'] as String),
    );

Map<String, dynamic> _$$JobModelImplToJson(_$JobModelImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'customerId': instance.customerId,
      'customerName': instance.customerName,
      'address': instance.address,
      'scheduledStartTime': instance.scheduledStartTime.toIso8601String(),
      'scheduledEndTime': instance.scheduledEndTime.toIso8601String(),
      'assignedContractors': instance.assignedContractors,
      'status': _$JobStatusEnumMap[instance.status]!,
      'tasks': instance.tasks,
      'notes': instance.notes,
      'actualStartTime': instance.actualStartTime?.toIso8601String(),
      'actualEndTime': instance.actualEndTime?.toIso8601String(),
      'photosRequired': instance.photosRequired,
      'location': instance.location,
      'createdAt': instance.createdAt.toIso8601String(),
      'completedAt': instance.completedAt?.toIso8601String(),
    };

const _$JobStatusEnumMap = {
  JobStatus.pending: 'pending',
  JobStatus.inProgress: 'inProgress',
  JobStatus.completed: 'completed',
  JobStatus.cancelled: 'cancelled',
  JobStatus.delayed: 'delayed',
};

_$CleaningTaskImpl _$$CleaningTaskImplFromJson(Map<String, dynamic> json) =>
    _$CleaningTaskImpl(
      id: json['id'] as String,
      title: json['title'] as String,
      description: json['description'] as String,
      isCompleted: json['isCompleted'] as bool? ?? false,
      completedBy: json['completedBy'] as String?,
      completedAt: json['completedAt'] == null
          ? null
          : DateTime.parse(json['completedAt'] as String),
      photoUrls: (json['photoUrls'] as List<dynamic>?)
          ?.map((e) => e as String)
          .toList(),
      pendingPhotos: (json['pendingPhotos'] as List<dynamic>?)
          ?.map((e) => e as String)
          .toList(),
    );

Map<String, dynamic> _$$CleaningTaskImplToJson(_$CleaningTaskImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'title': instance.title,
      'description': instance.description,
      'isCompleted': instance.isCompleted,
      'completedBy': instance.completedBy,
      'completedAt': instance.completedAt?.toIso8601String(),
      'photoUrls': instance.photoUrls,
      'pendingPhotos': instance.pendingPhotos,
    };
