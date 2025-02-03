part of 'job_bloc.dart';

@freezed
class JobState with _$JobState {
  const factory JobState.initial() = _Initial;
  const factory JobState.loading() = _Loading;
  const factory JobState.error(String message) = _Error;
  const factory JobState.loaded(List<Job> jobs) = _Loaded;
  const factory JobState.jobStarted(Job job) = _JobStarted;
  const factory JobState.taskCompleted(Job job) = _TaskCompleted;
  const factory JobState.photosUploaded(List<String> urls) = _PhotosUploaded;
  const factory JobState.geofenceChecked(bool isWithinGeofence) = _GeofenceChecked;
  const factory JobState.geofenceError() = _GeofenceError;
} 