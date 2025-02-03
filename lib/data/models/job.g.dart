// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'job.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$JobImpl _$$JobImplFromJson(Map<String, dynamic> json) => _$JobImpl(
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
      tasks: (json['tasks'] as List<dynamic>)
          .map((e) => CleaningTask.fromJson(e as Map<String, dynamic>))
          .toList(),
      notes: json['notes'] as String?,
      actualStartTime: json['actualStartTime'] == null
          ? null
          : DateTime.parse(json['actualStartTime'] as String),
      actualEndTime: json['actualEndTime'] == null
          ? null
          : DateTime.parse(json['actualEndTime'] as String),
      requiresKey: json['requiresKey'] as bool? ?? false,
      photosRequired: json['photosRequired'] as bool? ?? false,
      location: json['location'] == null
          ? null
          : GeoLocation.fromJson(json['location'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$$JobImplToJson(_$JobImpl instance) => <String, dynamic>{
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
      'requiresKey': instance.requiresKey,
      'photosRequired': instance.photosRequired,
      'location': instance.location,
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
      name: json['name'] as String,
      isCompleted: json['isCompleted'] as bool,
      type: $enumDecode(_$TaskTypeEnumMap, json['type']),
      notes: json['notes'] as String?,
      photoUrls: (json['photoUrls'] as List<dynamic>?)
          ?.map((e) => e as String)
          .toList(),
      completedAt: json['completedAt'] == null
          ? null
          : DateTime.parse(json['completedAt'] as String),
      completedBy: json['completedBy'] as String?,
    );

Map<String, dynamic> _$$CleaningTaskImplToJson(_$CleaningTaskImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'isCompleted': instance.isCompleted,
      'type': _$TaskTypeEnumMap[instance.type]!,
      'notes': instance.notes,
      'photoUrls': instance.photoUrls,
      'completedAt': instance.completedAt?.toIso8601String(),
      'completedBy': instance.completedBy,
    };

const _$TaskTypeEnumMap = {
  TaskType.general: 'general',
  TaskType.deep: 'deep',
  TaskType.custom: 'custom',
};

_$GeoLocationImpl _$$GeoLocationImplFromJson(Map<String, dynamic> json) =>
    _$GeoLocationImpl(
      latitude: (json['latitude'] as num).toDouble(),
      longitude: (json['longitude'] as num).toDouble(),
      accuracy: (json['accuracy'] as num?)?.toDouble(),
    );

Map<String, dynamic> _$$GeoLocationImplToJson(_$GeoLocationImpl instance) =>
    <String, dynamic>{
      'latitude': instance.latitude,
      'longitude': instance.longitude,
      'accuracy': instance.accuracy,
    };
