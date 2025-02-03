part of 'job_bloc.dart';

@freezed
class JobEvent with _$JobEvent {
  const factory JobEvent.loadJobs({
    required String contractorId,
  }) = _LoadJobs;

  const factory JobEvent.startJob({
    required String jobId,
    required GeoLocation location,
  }) = _StartJob;

  const factory JobEvent.completeTask({
    required String jobId,
    required String taskId,
    required String completedBy,
  }) = _CompleteTask;

  const factory JobEvent.uploadPhotos({
    required String jobId,
    required String taskId,
    required List<String> photoPaths,
  }) = _UploadPhotos;

  const factory JobEvent.checkGeofence({
    required String jobId,
    required GeoLocation location,
  }) = _CheckGeofence;
} 