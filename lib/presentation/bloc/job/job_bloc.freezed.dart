// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'job_bloc.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$JobEvent {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String contractorId) loadJobs,
    required TResult Function(String jobId, GeoLocation location) startJob,
    required TResult Function(String jobId, String taskId, String completedBy)
        completeTask,
    required TResult Function(
            String jobId, String taskId, List<String> photoPaths)
        uploadPhotos,
    required TResult Function(String jobId, GeoLocation location) checkGeofence,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(String contractorId)? loadJobs,
    TResult? Function(String jobId, GeoLocation location)? startJob,
    TResult? Function(String jobId, String taskId, String completedBy)?
        completeTask,
    TResult? Function(String jobId, String taskId, List<String> photoPaths)?
        uploadPhotos,
    TResult? Function(String jobId, GeoLocation location)? checkGeofence,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String contractorId)? loadJobs,
    TResult Function(String jobId, GeoLocation location)? startJob,
    TResult Function(String jobId, String taskId, String completedBy)?
        completeTask,
    TResult Function(String jobId, String taskId, List<String> photoPaths)?
        uploadPhotos,
    TResult Function(String jobId, GeoLocation location)? checkGeofence,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_LoadJobs value) loadJobs,
    required TResult Function(_StartJob value) startJob,
    required TResult Function(_CompleteTask value) completeTask,
    required TResult Function(_UploadPhotos value) uploadPhotos,
    required TResult Function(_CheckGeofence value) checkGeofence,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_LoadJobs value)? loadJobs,
    TResult? Function(_StartJob value)? startJob,
    TResult? Function(_CompleteTask value)? completeTask,
    TResult? Function(_UploadPhotos value)? uploadPhotos,
    TResult? Function(_CheckGeofence value)? checkGeofence,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_LoadJobs value)? loadJobs,
    TResult Function(_StartJob value)? startJob,
    TResult Function(_CompleteTask value)? completeTask,
    TResult Function(_UploadPhotos value)? uploadPhotos,
    TResult Function(_CheckGeofence value)? checkGeofence,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $JobEventCopyWith<$Res> {
  factory $JobEventCopyWith(JobEvent value, $Res Function(JobEvent) then) =
      _$JobEventCopyWithImpl<$Res, JobEvent>;
}

/// @nodoc
class _$JobEventCopyWithImpl<$Res, $Val extends JobEvent>
    implements $JobEventCopyWith<$Res> {
  _$JobEventCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;
}

/// @nodoc
abstract class _$$LoadJobsImplCopyWith<$Res> {
  factory _$$LoadJobsImplCopyWith(
          _$LoadJobsImpl value, $Res Function(_$LoadJobsImpl) then) =
      __$$LoadJobsImplCopyWithImpl<$Res>;
  @useResult
  $Res call({String contractorId});
}

/// @nodoc
class __$$LoadJobsImplCopyWithImpl<$Res>
    extends _$JobEventCopyWithImpl<$Res, _$LoadJobsImpl>
    implements _$$LoadJobsImplCopyWith<$Res> {
  __$$LoadJobsImplCopyWithImpl(
      _$LoadJobsImpl _value, $Res Function(_$LoadJobsImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? contractorId = null,
  }) {
    return _then(_$LoadJobsImpl(
      contractorId: null == contractorId
          ? _value.contractorId
          : contractorId // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$LoadJobsImpl implements _LoadJobs {
  const _$LoadJobsImpl({required this.contractorId});

  @override
  final String contractorId;

  @override
  String toString() {
    return 'JobEvent.loadJobs(contractorId: $contractorId)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$LoadJobsImpl &&
            (identical(other.contractorId, contractorId) ||
                other.contractorId == contractorId));
  }

  @override
  int get hashCode => Object.hash(runtimeType, contractorId);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$LoadJobsImplCopyWith<_$LoadJobsImpl> get copyWith =>
      __$$LoadJobsImplCopyWithImpl<_$LoadJobsImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String contractorId) loadJobs,
    required TResult Function(String jobId, GeoLocation location) startJob,
    required TResult Function(String jobId, String taskId, String completedBy)
        completeTask,
    required TResult Function(
            String jobId, String taskId, List<String> photoPaths)
        uploadPhotos,
    required TResult Function(String jobId, GeoLocation location) checkGeofence,
  }) {
    return loadJobs(contractorId);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(String contractorId)? loadJobs,
    TResult? Function(String jobId, GeoLocation location)? startJob,
    TResult? Function(String jobId, String taskId, String completedBy)?
        completeTask,
    TResult? Function(String jobId, String taskId, List<String> photoPaths)?
        uploadPhotos,
    TResult? Function(String jobId, GeoLocation location)? checkGeofence,
  }) {
    return loadJobs?.call(contractorId);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String contractorId)? loadJobs,
    TResult Function(String jobId, GeoLocation location)? startJob,
    TResult Function(String jobId, String taskId, String completedBy)?
        completeTask,
    TResult Function(String jobId, String taskId, List<String> photoPaths)?
        uploadPhotos,
    TResult Function(String jobId, GeoLocation location)? checkGeofence,
    required TResult orElse(),
  }) {
    if (loadJobs != null) {
      return loadJobs(contractorId);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_LoadJobs value) loadJobs,
    required TResult Function(_StartJob value) startJob,
    required TResult Function(_CompleteTask value) completeTask,
    required TResult Function(_UploadPhotos value) uploadPhotos,
    required TResult Function(_CheckGeofence value) checkGeofence,
  }) {
    return loadJobs(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_LoadJobs value)? loadJobs,
    TResult? Function(_StartJob value)? startJob,
    TResult? Function(_CompleteTask value)? completeTask,
    TResult? Function(_UploadPhotos value)? uploadPhotos,
    TResult? Function(_CheckGeofence value)? checkGeofence,
  }) {
    return loadJobs?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_LoadJobs value)? loadJobs,
    TResult Function(_StartJob value)? startJob,
    TResult Function(_CompleteTask value)? completeTask,
    TResult Function(_UploadPhotos value)? uploadPhotos,
    TResult Function(_CheckGeofence value)? checkGeofence,
    required TResult orElse(),
  }) {
    if (loadJobs != null) {
      return loadJobs(this);
    }
    return orElse();
  }
}

abstract class _LoadJobs implements JobEvent {
  const factory _LoadJobs({required final String contractorId}) =
      _$LoadJobsImpl;

  String get contractorId;
  @JsonKey(ignore: true)
  _$$LoadJobsImplCopyWith<_$LoadJobsImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$StartJobImplCopyWith<$Res> {
  factory _$$StartJobImplCopyWith(
          _$StartJobImpl value, $Res Function(_$StartJobImpl) then) =
      __$$StartJobImplCopyWithImpl<$Res>;
  @useResult
  $Res call({String jobId, GeoLocation location});

  $GeoLocationCopyWith<$Res> get location;
}

/// @nodoc
class __$$StartJobImplCopyWithImpl<$Res>
    extends _$JobEventCopyWithImpl<$Res, _$StartJobImpl>
    implements _$$StartJobImplCopyWith<$Res> {
  __$$StartJobImplCopyWithImpl(
      _$StartJobImpl _value, $Res Function(_$StartJobImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? jobId = null,
    Object? location = null,
  }) {
    return _then(_$StartJobImpl(
      jobId: null == jobId
          ? _value.jobId
          : jobId // ignore: cast_nullable_to_non_nullable
              as String,
      location: null == location
          ? _value.location
          : location // ignore: cast_nullable_to_non_nullable
              as GeoLocation,
    ));
  }

  @override
  @pragma('vm:prefer-inline')
  $GeoLocationCopyWith<$Res> get location {
    return $GeoLocationCopyWith<$Res>(_value.location, (value) {
      return _then(_value.copyWith(location: value));
    });
  }
}

/// @nodoc

class _$StartJobImpl implements _StartJob {
  const _$StartJobImpl({required this.jobId, required this.location});

  @override
  final String jobId;
  @override
  final GeoLocation location;

  @override
  String toString() {
    return 'JobEvent.startJob(jobId: $jobId, location: $location)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$StartJobImpl &&
            (identical(other.jobId, jobId) || other.jobId == jobId) &&
            (identical(other.location, location) ||
                other.location == location));
  }

  @override
  int get hashCode => Object.hash(runtimeType, jobId, location);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$StartJobImplCopyWith<_$StartJobImpl> get copyWith =>
      __$$StartJobImplCopyWithImpl<_$StartJobImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String contractorId) loadJobs,
    required TResult Function(String jobId, GeoLocation location) startJob,
    required TResult Function(String jobId, String taskId, String completedBy)
        completeTask,
    required TResult Function(
            String jobId, String taskId, List<String> photoPaths)
        uploadPhotos,
    required TResult Function(String jobId, GeoLocation location) checkGeofence,
  }) {
    return startJob(jobId, location);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(String contractorId)? loadJobs,
    TResult? Function(String jobId, GeoLocation location)? startJob,
    TResult? Function(String jobId, String taskId, String completedBy)?
        completeTask,
    TResult? Function(String jobId, String taskId, List<String> photoPaths)?
        uploadPhotos,
    TResult? Function(String jobId, GeoLocation location)? checkGeofence,
  }) {
    return startJob?.call(jobId, location);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String contractorId)? loadJobs,
    TResult Function(String jobId, GeoLocation location)? startJob,
    TResult Function(String jobId, String taskId, String completedBy)?
        completeTask,
    TResult Function(String jobId, String taskId, List<String> photoPaths)?
        uploadPhotos,
    TResult Function(String jobId, GeoLocation location)? checkGeofence,
    required TResult orElse(),
  }) {
    if (startJob != null) {
      return startJob(jobId, location);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_LoadJobs value) loadJobs,
    required TResult Function(_StartJob value) startJob,
    required TResult Function(_CompleteTask value) completeTask,
    required TResult Function(_UploadPhotos value) uploadPhotos,
    required TResult Function(_CheckGeofence value) checkGeofence,
  }) {
    return startJob(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_LoadJobs value)? loadJobs,
    TResult? Function(_StartJob value)? startJob,
    TResult? Function(_CompleteTask value)? completeTask,
    TResult? Function(_UploadPhotos value)? uploadPhotos,
    TResult? Function(_CheckGeofence value)? checkGeofence,
  }) {
    return startJob?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_LoadJobs value)? loadJobs,
    TResult Function(_StartJob value)? startJob,
    TResult Function(_CompleteTask value)? completeTask,
    TResult Function(_UploadPhotos value)? uploadPhotos,
    TResult Function(_CheckGeofence value)? checkGeofence,
    required TResult orElse(),
  }) {
    if (startJob != null) {
      return startJob(this);
    }
    return orElse();
  }
}

abstract class _StartJob implements JobEvent {
  const factory _StartJob(
      {required final String jobId,
      required final GeoLocation location}) = _$StartJobImpl;

  String get jobId;
  GeoLocation get location;
  @JsonKey(ignore: true)
  _$$StartJobImplCopyWith<_$StartJobImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$CompleteTaskImplCopyWith<$Res> {
  factory _$$CompleteTaskImplCopyWith(
          _$CompleteTaskImpl value, $Res Function(_$CompleteTaskImpl) then) =
      __$$CompleteTaskImplCopyWithImpl<$Res>;
  @useResult
  $Res call({String jobId, String taskId, String completedBy});
}

/// @nodoc
class __$$CompleteTaskImplCopyWithImpl<$Res>
    extends _$JobEventCopyWithImpl<$Res, _$CompleteTaskImpl>
    implements _$$CompleteTaskImplCopyWith<$Res> {
  __$$CompleteTaskImplCopyWithImpl(
      _$CompleteTaskImpl _value, $Res Function(_$CompleteTaskImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? jobId = null,
    Object? taskId = null,
    Object? completedBy = null,
  }) {
    return _then(_$CompleteTaskImpl(
      jobId: null == jobId
          ? _value.jobId
          : jobId // ignore: cast_nullable_to_non_nullable
              as String,
      taskId: null == taskId
          ? _value.taskId
          : taskId // ignore: cast_nullable_to_non_nullable
              as String,
      completedBy: null == completedBy
          ? _value.completedBy
          : completedBy // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$CompleteTaskImpl implements _CompleteTask {
  const _$CompleteTaskImpl(
      {required this.jobId, required this.taskId, required this.completedBy});

  @override
  final String jobId;
  @override
  final String taskId;
  @override
  final String completedBy;

  @override
  String toString() {
    return 'JobEvent.completeTask(jobId: $jobId, taskId: $taskId, completedBy: $completedBy)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$CompleteTaskImpl &&
            (identical(other.jobId, jobId) || other.jobId == jobId) &&
            (identical(other.taskId, taskId) || other.taskId == taskId) &&
            (identical(other.completedBy, completedBy) ||
                other.completedBy == completedBy));
  }

  @override
  int get hashCode => Object.hash(runtimeType, jobId, taskId, completedBy);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$CompleteTaskImplCopyWith<_$CompleteTaskImpl> get copyWith =>
      __$$CompleteTaskImplCopyWithImpl<_$CompleteTaskImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String contractorId) loadJobs,
    required TResult Function(String jobId, GeoLocation location) startJob,
    required TResult Function(String jobId, String taskId, String completedBy)
        completeTask,
    required TResult Function(
            String jobId, String taskId, List<String> photoPaths)
        uploadPhotos,
    required TResult Function(String jobId, GeoLocation location) checkGeofence,
  }) {
    return completeTask(jobId, taskId, completedBy);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(String contractorId)? loadJobs,
    TResult? Function(String jobId, GeoLocation location)? startJob,
    TResult? Function(String jobId, String taskId, String completedBy)?
        completeTask,
    TResult? Function(String jobId, String taskId, List<String> photoPaths)?
        uploadPhotos,
    TResult? Function(String jobId, GeoLocation location)? checkGeofence,
  }) {
    return completeTask?.call(jobId, taskId, completedBy);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String contractorId)? loadJobs,
    TResult Function(String jobId, GeoLocation location)? startJob,
    TResult Function(String jobId, String taskId, String completedBy)?
        completeTask,
    TResult Function(String jobId, String taskId, List<String> photoPaths)?
        uploadPhotos,
    TResult Function(String jobId, GeoLocation location)? checkGeofence,
    required TResult orElse(),
  }) {
    if (completeTask != null) {
      return completeTask(jobId, taskId, completedBy);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_LoadJobs value) loadJobs,
    required TResult Function(_StartJob value) startJob,
    required TResult Function(_CompleteTask value) completeTask,
    required TResult Function(_UploadPhotos value) uploadPhotos,
    required TResult Function(_CheckGeofence value) checkGeofence,
  }) {
    return completeTask(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_LoadJobs value)? loadJobs,
    TResult? Function(_StartJob value)? startJob,
    TResult? Function(_CompleteTask value)? completeTask,
    TResult? Function(_UploadPhotos value)? uploadPhotos,
    TResult? Function(_CheckGeofence value)? checkGeofence,
  }) {
    return completeTask?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_LoadJobs value)? loadJobs,
    TResult Function(_StartJob value)? startJob,
    TResult Function(_CompleteTask value)? completeTask,
    TResult Function(_UploadPhotos value)? uploadPhotos,
    TResult Function(_CheckGeofence value)? checkGeofence,
    required TResult orElse(),
  }) {
    if (completeTask != null) {
      return completeTask(this);
    }
    return orElse();
  }
}

abstract class _CompleteTask implements JobEvent {
  const factory _CompleteTask(
      {required final String jobId,
      required final String taskId,
      required final String completedBy}) = _$CompleteTaskImpl;

  String get jobId;
  String get taskId;
  String get completedBy;
  @JsonKey(ignore: true)
  _$$CompleteTaskImplCopyWith<_$CompleteTaskImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$UploadPhotosImplCopyWith<$Res> {
  factory _$$UploadPhotosImplCopyWith(
          _$UploadPhotosImpl value, $Res Function(_$UploadPhotosImpl) then) =
      __$$UploadPhotosImplCopyWithImpl<$Res>;
  @useResult
  $Res call({String jobId, String taskId, List<String> photoPaths});
}

/// @nodoc
class __$$UploadPhotosImplCopyWithImpl<$Res>
    extends _$JobEventCopyWithImpl<$Res, _$UploadPhotosImpl>
    implements _$$UploadPhotosImplCopyWith<$Res> {
  __$$UploadPhotosImplCopyWithImpl(
      _$UploadPhotosImpl _value, $Res Function(_$UploadPhotosImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? jobId = null,
    Object? taskId = null,
    Object? photoPaths = null,
  }) {
    return _then(_$UploadPhotosImpl(
      jobId: null == jobId
          ? _value.jobId
          : jobId // ignore: cast_nullable_to_non_nullable
              as String,
      taskId: null == taskId
          ? _value.taskId
          : taskId // ignore: cast_nullable_to_non_nullable
              as String,
      photoPaths: null == photoPaths
          ? _value._photoPaths
          : photoPaths // ignore: cast_nullable_to_non_nullable
              as List<String>,
    ));
  }
}

/// @nodoc

class _$UploadPhotosImpl implements _UploadPhotos {
  const _$UploadPhotosImpl(
      {required this.jobId,
      required this.taskId,
      required final List<String> photoPaths})
      : _photoPaths = photoPaths;

  @override
  final String jobId;
  @override
  final String taskId;
  final List<String> _photoPaths;
  @override
  List<String> get photoPaths {
    if (_photoPaths is EqualUnmodifiableListView) return _photoPaths;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_photoPaths);
  }

  @override
  String toString() {
    return 'JobEvent.uploadPhotos(jobId: $jobId, taskId: $taskId, photoPaths: $photoPaths)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$UploadPhotosImpl &&
            (identical(other.jobId, jobId) || other.jobId == jobId) &&
            (identical(other.taskId, taskId) || other.taskId == taskId) &&
            const DeepCollectionEquality()
                .equals(other._photoPaths, _photoPaths));
  }

  @override
  int get hashCode => Object.hash(runtimeType, jobId, taskId,
      const DeepCollectionEquality().hash(_photoPaths));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$UploadPhotosImplCopyWith<_$UploadPhotosImpl> get copyWith =>
      __$$UploadPhotosImplCopyWithImpl<_$UploadPhotosImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String contractorId) loadJobs,
    required TResult Function(String jobId, GeoLocation location) startJob,
    required TResult Function(String jobId, String taskId, String completedBy)
        completeTask,
    required TResult Function(
            String jobId, String taskId, List<String> photoPaths)
        uploadPhotos,
    required TResult Function(String jobId, GeoLocation location) checkGeofence,
  }) {
    return uploadPhotos(jobId, taskId, photoPaths);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(String contractorId)? loadJobs,
    TResult? Function(String jobId, GeoLocation location)? startJob,
    TResult? Function(String jobId, String taskId, String completedBy)?
        completeTask,
    TResult? Function(String jobId, String taskId, List<String> photoPaths)?
        uploadPhotos,
    TResult? Function(String jobId, GeoLocation location)? checkGeofence,
  }) {
    return uploadPhotos?.call(jobId, taskId, photoPaths);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String contractorId)? loadJobs,
    TResult Function(String jobId, GeoLocation location)? startJob,
    TResult Function(String jobId, String taskId, String completedBy)?
        completeTask,
    TResult Function(String jobId, String taskId, List<String> photoPaths)?
        uploadPhotos,
    TResult Function(String jobId, GeoLocation location)? checkGeofence,
    required TResult orElse(),
  }) {
    if (uploadPhotos != null) {
      return uploadPhotos(jobId, taskId, photoPaths);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_LoadJobs value) loadJobs,
    required TResult Function(_StartJob value) startJob,
    required TResult Function(_CompleteTask value) completeTask,
    required TResult Function(_UploadPhotos value) uploadPhotos,
    required TResult Function(_CheckGeofence value) checkGeofence,
  }) {
    return uploadPhotos(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_LoadJobs value)? loadJobs,
    TResult? Function(_StartJob value)? startJob,
    TResult? Function(_CompleteTask value)? completeTask,
    TResult? Function(_UploadPhotos value)? uploadPhotos,
    TResult? Function(_CheckGeofence value)? checkGeofence,
  }) {
    return uploadPhotos?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_LoadJobs value)? loadJobs,
    TResult Function(_StartJob value)? startJob,
    TResult Function(_CompleteTask value)? completeTask,
    TResult Function(_UploadPhotos value)? uploadPhotos,
    TResult Function(_CheckGeofence value)? checkGeofence,
    required TResult orElse(),
  }) {
    if (uploadPhotos != null) {
      return uploadPhotos(this);
    }
    return orElse();
  }
}

abstract class _UploadPhotos implements JobEvent {
  const factory _UploadPhotos(
      {required final String jobId,
      required final String taskId,
      required final List<String> photoPaths}) = _$UploadPhotosImpl;

  String get jobId;
  String get taskId;
  List<String> get photoPaths;
  @JsonKey(ignore: true)
  _$$UploadPhotosImplCopyWith<_$UploadPhotosImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$CheckGeofenceImplCopyWith<$Res> {
  factory _$$CheckGeofenceImplCopyWith(
          _$CheckGeofenceImpl value, $Res Function(_$CheckGeofenceImpl) then) =
      __$$CheckGeofenceImplCopyWithImpl<$Res>;
  @useResult
  $Res call({String jobId, GeoLocation location});

  $GeoLocationCopyWith<$Res> get location;
}

/// @nodoc
class __$$CheckGeofenceImplCopyWithImpl<$Res>
    extends _$JobEventCopyWithImpl<$Res, _$CheckGeofenceImpl>
    implements _$$CheckGeofenceImplCopyWith<$Res> {
  __$$CheckGeofenceImplCopyWithImpl(
      _$CheckGeofenceImpl _value, $Res Function(_$CheckGeofenceImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? jobId = null,
    Object? location = null,
  }) {
    return _then(_$CheckGeofenceImpl(
      jobId: null == jobId
          ? _value.jobId
          : jobId // ignore: cast_nullable_to_non_nullable
              as String,
      location: null == location
          ? _value.location
          : location // ignore: cast_nullable_to_non_nullable
              as GeoLocation,
    ));
  }

  @override
  @pragma('vm:prefer-inline')
  $GeoLocationCopyWith<$Res> get location {
    return $GeoLocationCopyWith<$Res>(_value.location, (value) {
      return _then(_value.copyWith(location: value));
    });
  }
}

/// @nodoc

class _$CheckGeofenceImpl implements _CheckGeofence {
  const _$CheckGeofenceImpl({required this.jobId, required this.location});

  @override
  final String jobId;
  @override
  final GeoLocation location;

  @override
  String toString() {
    return 'JobEvent.checkGeofence(jobId: $jobId, location: $location)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$CheckGeofenceImpl &&
            (identical(other.jobId, jobId) || other.jobId == jobId) &&
            (identical(other.location, location) ||
                other.location == location));
  }

  @override
  int get hashCode => Object.hash(runtimeType, jobId, location);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$CheckGeofenceImplCopyWith<_$CheckGeofenceImpl> get copyWith =>
      __$$CheckGeofenceImplCopyWithImpl<_$CheckGeofenceImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String contractorId) loadJobs,
    required TResult Function(String jobId, GeoLocation location) startJob,
    required TResult Function(String jobId, String taskId, String completedBy)
        completeTask,
    required TResult Function(
            String jobId, String taskId, List<String> photoPaths)
        uploadPhotos,
    required TResult Function(String jobId, GeoLocation location) checkGeofence,
  }) {
    return checkGeofence(jobId, location);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(String contractorId)? loadJobs,
    TResult? Function(String jobId, GeoLocation location)? startJob,
    TResult? Function(String jobId, String taskId, String completedBy)?
        completeTask,
    TResult? Function(String jobId, String taskId, List<String> photoPaths)?
        uploadPhotos,
    TResult? Function(String jobId, GeoLocation location)? checkGeofence,
  }) {
    return checkGeofence?.call(jobId, location);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String contractorId)? loadJobs,
    TResult Function(String jobId, GeoLocation location)? startJob,
    TResult Function(String jobId, String taskId, String completedBy)?
        completeTask,
    TResult Function(String jobId, String taskId, List<String> photoPaths)?
        uploadPhotos,
    TResult Function(String jobId, GeoLocation location)? checkGeofence,
    required TResult orElse(),
  }) {
    if (checkGeofence != null) {
      return checkGeofence(jobId, location);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_LoadJobs value) loadJobs,
    required TResult Function(_StartJob value) startJob,
    required TResult Function(_CompleteTask value) completeTask,
    required TResult Function(_UploadPhotos value) uploadPhotos,
    required TResult Function(_CheckGeofence value) checkGeofence,
  }) {
    return checkGeofence(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_LoadJobs value)? loadJobs,
    TResult? Function(_StartJob value)? startJob,
    TResult? Function(_CompleteTask value)? completeTask,
    TResult? Function(_UploadPhotos value)? uploadPhotos,
    TResult? Function(_CheckGeofence value)? checkGeofence,
  }) {
    return checkGeofence?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_LoadJobs value)? loadJobs,
    TResult Function(_StartJob value)? startJob,
    TResult Function(_CompleteTask value)? completeTask,
    TResult Function(_UploadPhotos value)? uploadPhotos,
    TResult Function(_CheckGeofence value)? checkGeofence,
    required TResult orElse(),
  }) {
    if (checkGeofence != null) {
      return checkGeofence(this);
    }
    return orElse();
  }
}

abstract class _CheckGeofence implements JobEvent {
  const factory _CheckGeofence(
      {required final String jobId,
      required final GeoLocation location}) = _$CheckGeofenceImpl;

  String get jobId;
  GeoLocation get location;
  @JsonKey(ignore: true)
  _$$CheckGeofenceImplCopyWith<_$CheckGeofenceImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
mixin _$JobState {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() loading,
    required TResult Function(String message) error,
    required TResult Function(List<Job> jobs) loaded,
    required TResult Function(Job job) jobStarted,
    required TResult Function(Job job) taskCompleted,
    required TResult Function(List<String> urls) photosUploaded,
    required TResult Function(bool isWithinGeofence) geofenceChecked,
    required TResult Function() geofenceError,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? loading,
    TResult? Function(String message)? error,
    TResult? Function(List<Job> jobs)? loaded,
    TResult? Function(Job job)? jobStarted,
    TResult? Function(Job job)? taskCompleted,
    TResult? Function(List<String> urls)? photosUploaded,
    TResult? Function(bool isWithinGeofence)? geofenceChecked,
    TResult? Function()? geofenceError,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function(String message)? error,
    TResult Function(List<Job> jobs)? loaded,
    TResult Function(Job job)? jobStarted,
    TResult Function(Job job)? taskCompleted,
    TResult Function(List<String> urls)? photosUploaded,
    TResult Function(bool isWithinGeofence)? geofenceChecked,
    TResult Function()? geofenceError,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initial value) initial,
    required TResult Function(_Loading value) loading,
    required TResult Function(_Error value) error,
    required TResult Function(_Loaded value) loaded,
    required TResult Function(_JobStarted value) jobStarted,
    required TResult Function(_TaskCompleted value) taskCompleted,
    required TResult Function(_PhotosUploaded value) photosUploaded,
    required TResult Function(_GeofenceChecked value) geofenceChecked,
    required TResult Function(_GeofenceError value) geofenceError,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initial value)? initial,
    TResult? Function(_Loading value)? loading,
    TResult? Function(_Error value)? error,
    TResult? Function(_Loaded value)? loaded,
    TResult? Function(_JobStarted value)? jobStarted,
    TResult? Function(_TaskCompleted value)? taskCompleted,
    TResult? Function(_PhotosUploaded value)? photosUploaded,
    TResult? Function(_GeofenceChecked value)? geofenceChecked,
    TResult? Function(_GeofenceError value)? geofenceError,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    TResult Function(_Loading value)? loading,
    TResult Function(_Error value)? error,
    TResult Function(_Loaded value)? loaded,
    TResult Function(_JobStarted value)? jobStarted,
    TResult Function(_TaskCompleted value)? taskCompleted,
    TResult Function(_PhotosUploaded value)? photosUploaded,
    TResult Function(_GeofenceChecked value)? geofenceChecked,
    TResult Function(_GeofenceError value)? geofenceError,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $JobStateCopyWith<$Res> {
  factory $JobStateCopyWith(JobState value, $Res Function(JobState) then) =
      _$JobStateCopyWithImpl<$Res, JobState>;
}

/// @nodoc
class _$JobStateCopyWithImpl<$Res, $Val extends JobState>
    implements $JobStateCopyWith<$Res> {
  _$JobStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;
}

/// @nodoc
abstract class _$$InitialImplCopyWith<$Res> {
  factory _$$InitialImplCopyWith(
          _$InitialImpl value, $Res Function(_$InitialImpl) then) =
      __$$InitialImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$InitialImplCopyWithImpl<$Res>
    extends _$JobStateCopyWithImpl<$Res, _$InitialImpl>
    implements _$$InitialImplCopyWith<$Res> {
  __$$InitialImplCopyWithImpl(
      _$InitialImpl _value, $Res Function(_$InitialImpl) _then)
      : super(_value, _then);
}

/// @nodoc

class _$InitialImpl implements _Initial {
  const _$InitialImpl();

  @override
  String toString() {
    return 'JobState.initial()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$InitialImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() loading,
    required TResult Function(String message) error,
    required TResult Function(List<Job> jobs) loaded,
    required TResult Function(Job job) jobStarted,
    required TResult Function(Job job) taskCompleted,
    required TResult Function(List<String> urls) photosUploaded,
    required TResult Function(bool isWithinGeofence) geofenceChecked,
    required TResult Function() geofenceError,
  }) {
    return initial();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? loading,
    TResult? Function(String message)? error,
    TResult? Function(List<Job> jobs)? loaded,
    TResult? Function(Job job)? jobStarted,
    TResult? Function(Job job)? taskCompleted,
    TResult? Function(List<String> urls)? photosUploaded,
    TResult? Function(bool isWithinGeofence)? geofenceChecked,
    TResult? Function()? geofenceError,
  }) {
    return initial?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function(String message)? error,
    TResult Function(List<Job> jobs)? loaded,
    TResult Function(Job job)? jobStarted,
    TResult Function(Job job)? taskCompleted,
    TResult Function(List<String> urls)? photosUploaded,
    TResult Function(bool isWithinGeofence)? geofenceChecked,
    TResult Function()? geofenceError,
    required TResult orElse(),
  }) {
    if (initial != null) {
      return initial();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initial value) initial,
    required TResult Function(_Loading value) loading,
    required TResult Function(_Error value) error,
    required TResult Function(_Loaded value) loaded,
    required TResult Function(_JobStarted value) jobStarted,
    required TResult Function(_TaskCompleted value) taskCompleted,
    required TResult Function(_PhotosUploaded value) photosUploaded,
    required TResult Function(_GeofenceChecked value) geofenceChecked,
    required TResult Function(_GeofenceError value) geofenceError,
  }) {
    return initial(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initial value)? initial,
    TResult? Function(_Loading value)? loading,
    TResult? Function(_Error value)? error,
    TResult? Function(_Loaded value)? loaded,
    TResult? Function(_JobStarted value)? jobStarted,
    TResult? Function(_TaskCompleted value)? taskCompleted,
    TResult? Function(_PhotosUploaded value)? photosUploaded,
    TResult? Function(_GeofenceChecked value)? geofenceChecked,
    TResult? Function(_GeofenceError value)? geofenceError,
  }) {
    return initial?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    TResult Function(_Loading value)? loading,
    TResult Function(_Error value)? error,
    TResult Function(_Loaded value)? loaded,
    TResult Function(_JobStarted value)? jobStarted,
    TResult Function(_TaskCompleted value)? taskCompleted,
    TResult Function(_PhotosUploaded value)? photosUploaded,
    TResult Function(_GeofenceChecked value)? geofenceChecked,
    TResult Function(_GeofenceError value)? geofenceError,
    required TResult orElse(),
  }) {
    if (initial != null) {
      return initial(this);
    }
    return orElse();
  }
}

abstract class _Initial implements JobState {
  const factory _Initial() = _$InitialImpl;
}

/// @nodoc
abstract class _$$LoadingImplCopyWith<$Res> {
  factory _$$LoadingImplCopyWith(
          _$LoadingImpl value, $Res Function(_$LoadingImpl) then) =
      __$$LoadingImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$LoadingImplCopyWithImpl<$Res>
    extends _$JobStateCopyWithImpl<$Res, _$LoadingImpl>
    implements _$$LoadingImplCopyWith<$Res> {
  __$$LoadingImplCopyWithImpl(
      _$LoadingImpl _value, $Res Function(_$LoadingImpl) _then)
      : super(_value, _then);
}

/// @nodoc

class _$LoadingImpl implements _Loading {
  const _$LoadingImpl();

  @override
  String toString() {
    return 'JobState.loading()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$LoadingImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() loading,
    required TResult Function(String message) error,
    required TResult Function(List<Job> jobs) loaded,
    required TResult Function(Job job) jobStarted,
    required TResult Function(Job job) taskCompleted,
    required TResult Function(List<String> urls) photosUploaded,
    required TResult Function(bool isWithinGeofence) geofenceChecked,
    required TResult Function() geofenceError,
  }) {
    return loading();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? loading,
    TResult? Function(String message)? error,
    TResult? Function(List<Job> jobs)? loaded,
    TResult? Function(Job job)? jobStarted,
    TResult? Function(Job job)? taskCompleted,
    TResult? Function(List<String> urls)? photosUploaded,
    TResult? Function(bool isWithinGeofence)? geofenceChecked,
    TResult? Function()? geofenceError,
  }) {
    return loading?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function(String message)? error,
    TResult Function(List<Job> jobs)? loaded,
    TResult Function(Job job)? jobStarted,
    TResult Function(Job job)? taskCompleted,
    TResult Function(List<String> urls)? photosUploaded,
    TResult Function(bool isWithinGeofence)? geofenceChecked,
    TResult Function()? geofenceError,
    required TResult orElse(),
  }) {
    if (loading != null) {
      return loading();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initial value) initial,
    required TResult Function(_Loading value) loading,
    required TResult Function(_Error value) error,
    required TResult Function(_Loaded value) loaded,
    required TResult Function(_JobStarted value) jobStarted,
    required TResult Function(_TaskCompleted value) taskCompleted,
    required TResult Function(_PhotosUploaded value) photosUploaded,
    required TResult Function(_GeofenceChecked value) geofenceChecked,
    required TResult Function(_GeofenceError value) geofenceError,
  }) {
    return loading(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initial value)? initial,
    TResult? Function(_Loading value)? loading,
    TResult? Function(_Error value)? error,
    TResult? Function(_Loaded value)? loaded,
    TResult? Function(_JobStarted value)? jobStarted,
    TResult? Function(_TaskCompleted value)? taskCompleted,
    TResult? Function(_PhotosUploaded value)? photosUploaded,
    TResult? Function(_GeofenceChecked value)? geofenceChecked,
    TResult? Function(_GeofenceError value)? geofenceError,
  }) {
    return loading?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    TResult Function(_Loading value)? loading,
    TResult Function(_Error value)? error,
    TResult Function(_Loaded value)? loaded,
    TResult Function(_JobStarted value)? jobStarted,
    TResult Function(_TaskCompleted value)? taskCompleted,
    TResult Function(_PhotosUploaded value)? photosUploaded,
    TResult Function(_GeofenceChecked value)? geofenceChecked,
    TResult Function(_GeofenceError value)? geofenceError,
    required TResult orElse(),
  }) {
    if (loading != null) {
      return loading(this);
    }
    return orElse();
  }
}

abstract class _Loading implements JobState {
  const factory _Loading() = _$LoadingImpl;
}

/// @nodoc
abstract class _$$ErrorImplCopyWith<$Res> {
  factory _$$ErrorImplCopyWith(
          _$ErrorImpl value, $Res Function(_$ErrorImpl) then) =
      __$$ErrorImplCopyWithImpl<$Res>;
  @useResult
  $Res call({String message});
}

/// @nodoc
class __$$ErrorImplCopyWithImpl<$Res>
    extends _$JobStateCopyWithImpl<$Res, _$ErrorImpl>
    implements _$$ErrorImplCopyWith<$Res> {
  __$$ErrorImplCopyWithImpl(
      _$ErrorImpl _value, $Res Function(_$ErrorImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? message = null,
  }) {
    return _then(_$ErrorImpl(
      null == message
          ? _value.message
          : message // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$ErrorImpl implements _Error {
  const _$ErrorImpl(this.message);

  @override
  final String message;

  @override
  String toString() {
    return 'JobState.error(message: $message)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ErrorImpl &&
            (identical(other.message, message) || other.message == message));
  }

  @override
  int get hashCode => Object.hash(runtimeType, message);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$ErrorImplCopyWith<_$ErrorImpl> get copyWith =>
      __$$ErrorImplCopyWithImpl<_$ErrorImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() loading,
    required TResult Function(String message) error,
    required TResult Function(List<Job> jobs) loaded,
    required TResult Function(Job job) jobStarted,
    required TResult Function(Job job) taskCompleted,
    required TResult Function(List<String> urls) photosUploaded,
    required TResult Function(bool isWithinGeofence) geofenceChecked,
    required TResult Function() geofenceError,
  }) {
    return error(message);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? loading,
    TResult? Function(String message)? error,
    TResult? Function(List<Job> jobs)? loaded,
    TResult? Function(Job job)? jobStarted,
    TResult? Function(Job job)? taskCompleted,
    TResult? Function(List<String> urls)? photosUploaded,
    TResult? Function(bool isWithinGeofence)? geofenceChecked,
    TResult? Function()? geofenceError,
  }) {
    return error?.call(message);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function(String message)? error,
    TResult Function(List<Job> jobs)? loaded,
    TResult Function(Job job)? jobStarted,
    TResult Function(Job job)? taskCompleted,
    TResult Function(List<String> urls)? photosUploaded,
    TResult Function(bool isWithinGeofence)? geofenceChecked,
    TResult Function()? geofenceError,
    required TResult orElse(),
  }) {
    if (error != null) {
      return error(message);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initial value) initial,
    required TResult Function(_Loading value) loading,
    required TResult Function(_Error value) error,
    required TResult Function(_Loaded value) loaded,
    required TResult Function(_JobStarted value) jobStarted,
    required TResult Function(_TaskCompleted value) taskCompleted,
    required TResult Function(_PhotosUploaded value) photosUploaded,
    required TResult Function(_GeofenceChecked value) geofenceChecked,
    required TResult Function(_GeofenceError value) geofenceError,
  }) {
    return error(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initial value)? initial,
    TResult? Function(_Loading value)? loading,
    TResult? Function(_Error value)? error,
    TResult? Function(_Loaded value)? loaded,
    TResult? Function(_JobStarted value)? jobStarted,
    TResult? Function(_TaskCompleted value)? taskCompleted,
    TResult? Function(_PhotosUploaded value)? photosUploaded,
    TResult? Function(_GeofenceChecked value)? geofenceChecked,
    TResult? Function(_GeofenceError value)? geofenceError,
  }) {
    return error?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    TResult Function(_Loading value)? loading,
    TResult Function(_Error value)? error,
    TResult Function(_Loaded value)? loaded,
    TResult Function(_JobStarted value)? jobStarted,
    TResult Function(_TaskCompleted value)? taskCompleted,
    TResult Function(_PhotosUploaded value)? photosUploaded,
    TResult Function(_GeofenceChecked value)? geofenceChecked,
    TResult Function(_GeofenceError value)? geofenceError,
    required TResult orElse(),
  }) {
    if (error != null) {
      return error(this);
    }
    return orElse();
  }
}

abstract class _Error implements JobState {
  const factory _Error(final String message) = _$ErrorImpl;

  String get message;
  @JsonKey(ignore: true)
  _$$ErrorImplCopyWith<_$ErrorImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$LoadedImplCopyWith<$Res> {
  factory _$$LoadedImplCopyWith(
          _$LoadedImpl value, $Res Function(_$LoadedImpl) then) =
      __$$LoadedImplCopyWithImpl<$Res>;
  @useResult
  $Res call({List<Job> jobs});
}

/// @nodoc
class __$$LoadedImplCopyWithImpl<$Res>
    extends _$JobStateCopyWithImpl<$Res, _$LoadedImpl>
    implements _$$LoadedImplCopyWith<$Res> {
  __$$LoadedImplCopyWithImpl(
      _$LoadedImpl _value, $Res Function(_$LoadedImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? jobs = null,
  }) {
    return _then(_$LoadedImpl(
      null == jobs
          ? _value._jobs
          : jobs // ignore: cast_nullable_to_non_nullable
              as List<Job>,
    ));
  }
}

/// @nodoc

class _$LoadedImpl implements _Loaded {
  const _$LoadedImpl(final List<Job> jobs) : _jobs = jobs;

  final List<Job> _jobs;
  @override
  List<Job> get jobs {
    if (_jobs is EqualUnmodifiableListView) return _jobs;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_jobs);
  }

  @override
  String toString() {
    return 'JobState.loaded(jobs: $jobs)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$LoadedImpl &&
            const DeepCollectionEquality().equals(other._jobs, _jobs));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, const DeepCollectionEquality().hash(_jobs));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$LoadedImplCopyWith<_$LoadedImpl> get copyWith =>
      __$$LoadedImplCopyWithImpl<_$LoadedImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() loading,
    required TResult Function(String message) error,
    required TResult Function(List<Job> jobs) loaded,
    required TResult Function(Job job) jobStarted,
    required TResult Function(Job job) taskCompleted,
    required TResult Function(List<String> urls) photosUploaded,
    required TResult Function(bool isWithinGeofence) geofenceChecked,
    required TResult Function() geofenceError,
  }) {
    return loaded(jobs);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? loading,
    TResult? Function(String message)? error,
    TResult? Function(List<Job> jobs)? loaded,
    TResult? Function(Job job)? jobStarted,
    TResult? Function(Job job)? taskCompleted,
    TResult? Function(List<String> urls)? photosUploaded,
    TResult? Function(bool isWithinGeofence)? geofenceChecked,
    TResult? Function()? geofenceError,
  }) {
    return loaded?.call(jobs);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function(String message)? error,
    TResult Function(List<Job> jobs)? loaded,
    TResult Function(Job job)? jobStarted,
    TResult Function(Job job)? taskCompleted,
    TResult Function(List<String> urls)? photosUploaded,
    TResult Function(bool isWithinGeofence)? geofenceChecked,
    TResult Function()? geofenceError,
    required TResult orElse(),
  }) {
    if (loaded != null) {
      return loaded(jobs);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initial value) initial,
    required TResult Function(_Loading value) loading,
    required TResult Function(_Error value) error,
    required TResult Function(_Loaded value) loaded,
    required TResult Function(_JobStarted value) jobStarted,
    required TResult Function(_TaskCompleted value) taskCompleted,
    required TResult Function(_PhotosUploaded value) photosUploaded,
    required TResult Function(_GeofenceChecked value) geofenceChecked,
    required TResult Function(_GeofenceError value) geofenceError,
  }) {
    return loaded(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initial value)? initial,
    TResult? Function(_Loading value)? loading,
    TResult? Function(_Error value)? error,
    TResult? Function(_Loaded value)? loaded,
    TResult? Function(_JobStarted value)? jobStarted,
    TResult? Function(_TaskCompleted value)? taskCompleted,
    TResult? Function(_PhotosUploaded value)? photosUploaded,
    TResult? Function(_GeofenceChecked value)? geofenceChecked,
    TResult? Function(_GeofenceError value)? geofenceError,
  }) {
    return loaded?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    TResult Function(_Loading value)? loading,
    TResult Function(_Error value)? error,
    TResult Function(_Loaded value)? loaded,
    TResult Function(_JobStarted value)? jobStarted,
    TResult Function(_TaskCompleted value)? taskCompleted,
    TResult Function(_PhotosUploaded value)? photosUploaded,
    TResult Function(_GeofenceChecked value)? geofenceChecked,
    TResult Function(_GeofenceError value)? geofenceError,
    required TResult orElse(),
  }) {
    if (loaded != null) {
      return loaded(this);
    }
    return orElse();
  }
}

abstract class _Loaded implements JobState {
  const factory _Loaded(final List<Job> jobs) = _$LoadedImpl;

  List<Job> get jobs;
  @JsonKey(ignore: true)
  _$$LoadedImplCopyWith<_$LoadedImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$JobStartedImplCopyWith<$Res> {
  factory _$$JobStartedImplCopyWith(
          _$JobStartedImpl value, $Res Function(_$JobStartedImpl) then) =
      __$$JobStartedImplCopyWithImpl<$Res>;
  @useResult
  $Res call({Job job});

  $JobCopyWith<$Res> get job;
}

/// @nodoc
class __$$JobStartedImplCopyWithImpl<$Res>
    extends _$JobStateCopyWithImpl<$Res, _$JobStartedImpl>
    implements _$$JobStartedImplCopyWith<$Res> {
  __$$JobStartedImplCopyWithImpl(
      _$JobStartedImpl _value, $Res Function(_$JobStartedImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? job = null,
  }) {
    return _then(_$JobStartedImpl(
      null == job
          ? _value.job
          : job // ignore: cast_nullable_to_non_nullable
              as Job,
    ));
  }

  @override
  @pragma('vm:prefer-inline')
  $JobCopyWith<$Res> get job {
    return $JobCopyWith<$Res>(_value.job, (value) {
      return _then(_value.copyWith(job: value));
    });
  }
}

/// @nodoc

class _$JobStartedImpl implements _JobStarted {
  const _$JobStartedImpl(this.job);

  @override
  final Job job;

  @override
  String toString() {
    return 'JobState.jobStarted(job: $job)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$JobStartedImpl &&
            (identical(other.job, job) || other.job == job));
  }

  @override
  int get hashCode => Object.hash(runtimeType, job);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$JobStartedImplCopyWith<_$JobStartedImpl> get copyWith =>
      __$$JobStartedImplCopyWithImpl<_$JobStartedImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() loading,
    required TResult Function(String message) error,
    required TResult Function(List<Job> jobs) loaded,
    required TResult Function(Job job) jobStarted,
    required TResult Function(Job job) taskCompleted,
    required TResult Function(List<String> urls) photosUploaded,
    required TResult Function(bool isWithinGeofence) geofenceChecked,
    required TResult Function() geofenceError,
  }) {
    return jobStarted(job);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? loading,
    TResult? Function(String message)? error,
    TResult? Function(List<Job> jobs)? loaded,
    TResult? Function(Job job)? jobStarted,
    TResult? Function(Job job)? taskCompleted,
    TResult? Function(List<String> urls)? photosUploaded,
    TResult? Function(bool isWithinGeofence)? geofenceChecked,
    TResult? Function()? geofenceError,
  }) {
    return jobStarted?.call(job);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function(String message)? error,
    TResult Function(List<Job> jobs)? loaded,
    TResult Function(Job job)? jobStarted,
    TResult Function(Job job)? taskCompleted,
    TResult Function(List<String> urls)? photosUploaded,
    TResult Function(bool isWithinGeofence)? geofenceChecked,
    TResult Function()? geofenceError,
    required TResult orElse(),
  }) {
    if (jobStarted != null) {
      return jobStarted(job);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initial value) initial,
    required TResult Function(_Loading value) loading,
    required TResult Function(_Error value) error,
    required TResult Function(_Loaded value) loaded,
    required TResult Function(_JobStarted value) jobStarted,
    required TResult Function(_TaskCompleted value) taskCompleted,
    required TResult Function(_PhotosUploaded value) photosUploaded,
    required TResult Function(_GeofenceChecked value) geofenceChecked,
    required TResult Function(_GeofenceError value) geofenceError,
  }) {
    return jobStarted(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initial value)? initial,
    TResult? Function(_Loading value)? loading,
    TResult? Function(_Error value)? error,
    TResult? Function(_Loaded value)? loaded,
    TResult? Function(_JobStarted value)? jobStarted,
    TResult? Function(_TaskCompleted value)? taskCompleted,
    TResult? Function(_PhotosUploaded value)? photosUploaded,
    TResult? Function(_GeofenceChecked value)? geofenceChecked,
    TResult? Function(_GeofenceError value)? geofenceError,
  }) {
    return jobStarted?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    TResult Function(_Loading value)? loading,
    TResult Function(_Error value)? error,
    TResult Function(_Loaded value)? loaded,
    TResult Function(_JobStarted value)? jobStarted,
    TResult Function(_TaskCompleted value)? taskCompleted,
    TResult Function(_PhotosUploaded value)? photosUploaded,
    TResult Function(_GeofenceChecked value)? geofenceChecked,
    TResult Function(_GeofenceError value)? geofenceError,
    required TResult orElse(),
  }) {
    if (jobStarted != null) {
      return jobStarted(this);
    }
    return orElse();
  }
}

abstract class _JobStarted implements JobState {
  const factory _JobStarted(final Job job) = _$JobStartedImpl;

  Job get job;
  @JsonKey(ignore: true)
  _$$JobStartedImplCopyWith<_$JobStartedImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$TaskCompletedImplCopyWith<$Res> {
  factory _$$TaskCompletedImplCopyWith(
          _$TaskCompletedImpl value, $Res Function(_$TaskCompletedImpl) then) =
      __$$TaskCompletedImplCopyWithImpl<$Res>;
  @useResult
  $Res call({Job job});

  $JobCopyWith<$Res> get job;
}

/// @nodoc
class __$$TaskCompletedImplCopyWithImpl<$Res>
    extends _$JobStateCopyWithImpl<$Res, _$TaskCompletedImpl>
    implements _$$TaskCompletedImplCopyWith<$Res> {
  __$$TaskCompletedImplCopyWithImpl(
      _$TaskCompletedImpl _value, $Res Function(_$TaskCompletedImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? job = null,
  }) {
    return _then(_$TaskCompletedImpl(
      null == job
          ? _value.job
          : job // ignore: cast_nullable_to_non_nullable
              as Job,
    ));
  }

  @override
  @pragma('vm:prefer-inline')
  $JobCopyWith<$Res> get job {
    return $JobCopyWith<$Res>(_value.job, (value) {
      return _then(_value.copyWith(job: value));
    });
  }
}

/// @nodoc

class _$TaskCompletedImpl implements _TaskCompleted {
  const _$TaskCompletedImpl(this.job);

  @override
  final Job job;

  @override
  String toString() {
    return 'JobState.taskCompleted(job: $job)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$TaskCompletedImpl &&
            (identical(other.job, job) || other.job == job));
  }

  @override
  int get hashCode => Object.hash(runtimeType, job);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$TaskCompletedImplCopyWith<_$TaskCompletedImpl> get copyWith =>
      __$$TaskCompletedImplCopyWithImpl<_$TaskCompletedImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() loading,
    required TResult Function(String message) error,
    required TResult Function(List<Job> jobs) loaded,
    required TResult Function(Job job) jobStarted,
    required TResult Function(Job job) taskCompleted,
    required TResult Function(List<String> urls) photosUploaded,
    required TResult Function(bool isWithinGeofence) geofenceChecked,
    required TResult Function() geofenceError,
  }) {
    return taskCompleted(job);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? loading,
    TResult? Function(String message)? error,
    TResult? Function(List<Job> jobs)? loaded,
    TResult? Function(Job job)? jobStarted,
    TResult? Function(Job job)? taskCompleted,
    TResult? Function(List<String> urls)? photosUploaded,
    TResult? Function(bool isWithinGeofence)? geofenceChecked,
    TResult? Function()? geofenceError,
  }) {
    return taskCompleted?.call(job);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function(String message)? error,
    TResult Function(List<Job> jobs)? loaded,
    TResult Function(Job job)? jobStarted,
    TResult Function(Job job)? taskCompleted,
    TResult Function(List<String> urls)? photosUploaded,
    TResult Function(bool isWithinGeofence)? geofenceChecked,
    TResult Function()? geofenceError,
    required TResult orElse(),
  }) {
    if (taskCompleted != null) {
      return taskCompleted(job);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initial value) initial,
    required TResult Function(_Loading value) loading,
    required TResult Function(_Error value) error,
    required TResult Function(_Loaded value) loaded,
    required TResult Function(_JobStarted value) jobStarted,
    required TResult Function(_TaskCompleted value) taskCompleted,
    required TResult Function(_PhotosUploaded value) photosUploaded,
    required TResult Function(_GeofenceChecked value) geofenceChecked,
    required TResult Function(_GeofenceError value) geofenceError,
  }) {
    return taskCompleted(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initial value)? initial,
    TResult? Function(_Loading value)? loading,
    TResult? Function(_Error value)? error,
    TResult? Function(_Loaded value)? loaded,
    TResult? Function(_JobStarted value)? jobStarted,
    TResult? Function(_TaskCompleted value)? taskCompleted,
    TResult? Function(_PhotosUploaded value)? photosUploaded,
    TResult? Function(_GeofenceChecked value)? geofenceChecked,
    TResult? Function(_GeofenceError value)? geofenceError,
  }) {
    return taskCompleted?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    TResult Function(_Loading value)? loading,
    TResult Function(_Error value)? error,
    TResult Function(_Loaded value)? loaded,
    TResult Function(_JobStarted value)? jobStarted,
    TResult Function(_TaskCompleted value)? taskCompleted,
    TResult Function(_PhotosUploaded value)? photosUploaded,
    TResult Function(_GeofenceChecked value)? geofenceChecked,
    TResult Function(_GeofenceError value)? geofenceError,
    required TResult orElse(),
  }) {
    if (taskCompleted != null) {
      return taskCompleted(this);
    }
    return orElse();
  }
}

abstract class _TaskCompleted implements JobState {
  const factory _TaskCompleted(final Job job) = _$TaskCompletedImpl;

  Job get job;
  @JsonKey(ignore: true)
  _$$TaskCompletedImplCopyWith<_$TaskCompletedImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$PhotosUploadedImplCopyWith<$Res> {
  factory _$$PhotosUploadedImplCopyWith(_$PhotosUploadedImpl value,
          $Res Function(_$PhotosUploadedImpl) then) =
      __$$PhotosUploadedImplCopyWithImpl<$Res>;
  @useResult
  $Res call({List<String> urls});
}

/// @nodoc
class __$$PhotosUploadedImplCopyWithImpl<$Res>
    extends _$JobStateCopyWithImpl<$Res, _$PhotosUploadedImpl>
    implements _$$PhotosUploadedImplCopyWith<$Res> {
  __$$PhotosUploadedImplCopyWithImpl(
      _$PhotosUploadedImpl _value, $Res Function(_$PhotosUploadedImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? urls = null,
  }) {
    return _then(_$PhotosUploadedImpl(
      null == urls
          ? _value._urls
          : urls // ignore: cast_nullable_to_non_nullable
              as List<String>,
    ));
  }
}

/// @nodoc

class _$PhotosUploadedImpl implements _PhotosUploaded {
  const _$PhotosUploadedImpl(final List<String> urls) : _urls = urls;

  final List<String> _urls;
  @override
  List<String> get urls {
    if (_urls is EqualUnmodifiableListView) return _urls;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_urls);
  }

  @override
  String toString() {
    return 'JobState.photosUploaded(urls: $urls)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$PhotosUploadedImpl &&
            const DeepCollectionEquality().equals(other._urls, _urls));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, const DeepCollectionEquality().hash(_urls));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$PhotosUploadedImplCopyWith<_$PhotosUploadedImpl> get copyWith =>
      __$$PhotosUploadedImplCopyWithImpl<_$PhotosUploadedImpl>(
          this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() loading,
    required TResult Function(String message) error,
    required TResult Function(List<Job> jobs) loaded,
    required TResult Function(Job job) jobStarted,
    required TResult Function(Job job) taskCompleted,
    required TResult Function(List<String> urls) photosUploaded,
    required TResult Function(bool isWithinGeofence) geofenceChecked,
    required TResult Function() geofenceError,
  }) {
    return photosUploaded(urls);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? loading,
    TResult? Function(String message)? error,
    TResult? Function(List<Job> jobs)? loaded,
    TResult? Function(Job job)? jobStarted,
    TResult? Function(Job job)? taskCompleted,
    TResult? Function(List<String> urls)? photosUploaded,
    TResult? Function(bool isWithinGeofence)? geofenceChecked,
    TResult? Function()? geofenceError,
  }) {
    return photosUploaded?.call(urls);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function(String message)? error,
    TResult Function(List<Job> jobs)? loaded,
    TResult Function(Job job)? jobStarted,
    TResult Function(Job job)? taskCompleted,
    TResult Function(List<String> urls)? photosUploaded,
    TResult Function(bool isWithinGeofence)? geofenceChecked,
    TResult Function()? geofenceError,
    required TResult orElse(),
  }) {
    if (photosUploaded != null) {
      return photosUploaded(urls);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initial value) initial,
    required TResult Function(_Loading value) loading,
    required TResult Function(_Error value) error,
    required TResult Function(_Loaded value) loaded,
    required TResult Function(_JobStarted value) jobStarted,
    required TResult Function(_TaskCompleted value) taskCompleted,
    required TResult Function(_PhotosUploaded value) photosUploaded,
    required TResult Function(_GeofenceChecked value) geofenceChecked,
    required TResult Function(_GeofenceError value) geofenceError,
  }) {
    return photosUploaded(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initial value)? initial,
    TResult? Function(_Loading value)? loading,
    TResult? Function(_Error value)? error,
    TResult? Function(_Loaded value)? loaded,
    TResult? Function(_JobStarted value)? jobStarted,
    TResult? Function(_TaskCompleted value)? taskCompleted,
    TResult? Function(_PhotosUploaded value)? photosUploaded,
    TResult? Function(_GeofenceChecked value)? geofenceChecked,
    TResult? Function(_GeofenceError value)? geofenceError,
  }) {
    return photosUploaded?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    TResult Function(_Loading value)? loading,
    TResult Function(_Error value)? error,
    TResult Function(_Loaded value)? loaded,
    TResult Function(_JobStarted value)? jobStarted,
    TResult Function(_TaskCompleted value)? taskCompleted,
    TResult Function(_PhotosUploaded value)? photosUploaded,
    TResult Function(_GeofenceChecked value)? geofenceChecked,
    TResult Function(_GeofenceError value)? geofenceError,
    required TResult orElse(),
  }) {
    if (photosUploaded != null) {
      return photosUploaded(this);
    }
    return orElse();
  }
}

abstract class _PhotosUploaded implements JobState {
  const factory _PhotosUploaded(final List<String> urls) = _$PhotosUploadedImpl;

  List<String> get urls;
  @JsonKey(ignore: true)
  _$$PhotosUploadedImplCopyWith<_$PhotosUploadedImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$GeofenceCheckedImplCopyWith<$Res> {
  factory _$$GeofenceCheckedImplCopyWith(_$GeofenceCheckedImpl value,
          $Res Function(_$GeofenceCheckedImpl) then) =
      __$$GeofenceCheckedImplCopyWithImpl<$Res>;
  @useResult
  $Res call({bool isWithinGeofence});
}

/// @nodoc
class __$$GeofenceCheckedImplCopyWithImpl<$Res>
    extends _$JobStateCopyWithImpl<$Res, _$GeofenceCheckedImpl>
    implements _$$GeofenceCheckedImplCopyWith<$Res> {
  __$$GeofenceCheckedImplCopyWithImpl(
      _$GeofenceCheckedImpl _value, $Res Function(_$GeofenceCheckedImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? isWithinGeofence = null,
  }) {
    return _then(_$GeofenceCheckedImpl(
      null == isWithinGeofence
          ? _value.isWithinGeofence
          : isWithinGeofence // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

/// @nodoc

class _$GeofenceCheckedImpl implements _GeofenceChecked {
  const _$GeofenceCheckedImpl(this.isWithinGeofence);

  @override
  final bool isWithinGeofence;

  @override
  String toString() {
    return 'JobState.geofenceChecked(isWithinGeofence: $isWithinGeofence)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$GeofenceCheckedImpl &&
            (identical(other.isWithinGeofence, isWithinGeofence) ||
                other.isWithinGeofence == isWithinGeofence));
  }

  @override
  int get hashCode => Object.hash(runtimeType, isWithinGeofence);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$GeofenceCheckedImplCopyWith<_$GeofenceCheckedImpl> get copyWith =>
      __$$GeofenceCheckedImplCopyWithImpl<_$GeofenceCheckedImpl>(
          this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() loading,
    required TResult Function(String message) error,
    required TResult Function(List<Job> jobs) loaded,
    required TResult Function(Job job) jobStarted,
    required TResult Function(Job job) taskCompleted,
    required TResult Function(List<String> urls) photosUploaded,
    required TResult Function(bool isWithinGeofence) geofenceChecked,
    required TResult Function() geofenceError,
  }) {
    return geofenceChecked(isWithinGeofence);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? loading,
    TResult? Function(String message)? error,
    TResult? Function(List<Job> jobs)? loaded,
    TResult? Function(Job job)? jobStarted,
    TResult? Function(Job job)? taskCompleted,
    TResult? Function(List<String> urls)? photosUploaded,
    TResult? Function(bool isWithinGeofence)? geofenceChecked,
    TResult? Function()? geofenceError,
  }) {
    return geofenceChecked?.call(isWithinGeofence);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function(String message)? error,
    TResult Function(List<Job> jobs)? loaded,
    TResult Function(Job job)? jobStarted,
    TResult Function(Job job)? taskCompleted,
    TResult Function(List<String> urls)? photosUploaded,
    TResult Function(bool isWithinGeofence)? geofenceChecked,
    TResult Function()? geofenceError,
    required TResult orElse(),
  }) {
    if (geofenceChecked != null) {
      return geofenceChecked(isWithinGeofence);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initial value) initial,
    required TResult Function(_Loading value) loading,
    required TResult Function(_Error value) error,
    required TResult Function(_Loaded value) loaded,
    required TResult Function(_JobStarted value) jobStarted,
    required TResult Function(_TaskCompleted value) taskCompleted,
    required TResult Function(_PhotosUploaded value) photosUploaded,
    required TResult Function(_GeofenceChecked value) geofenceChecked,
    required TResult Function(_GeofenceError value) geofenceError,
  }) {
    return geofenceChecked(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initial value)? initial,
    TResult? Function(_Loading value)? loading,
    TResult? Function(_Error value)? error,
    TResult? Function(_Loaded value)? loaded,
    TResult? Function(_JobStarted value)? jobStarted,
    TResult? Function(_TaskCompleted value)? taskCompleted,
    TResult? Function(_PhotosUploaded value)? photosUploaded,
    TResult? Function(_GeofenceChecked value)? geofenceChecked,
    TResult? Function(_GeofenceError value)? geofenceError,
  }) {
    return geofenceChecked?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    TResult Function(_Loading value)? loading,
    TResult Function(_Error value)? error,
    TResult Function(_Loaded value)? loaded,
    TResult Function(_JobStarted value)? jobStarted,
    TResult Function(_TaskCompleted value)? taskCompleted,
    TResult Function(_PhotosUploaded value)? photosUploaded,
    TResult Function(_GeofenceChecked value)? geofenceChecked,
    TResult Function(_GeofenceError value)? geofenceError,
    required TResult orElse(),
  }) {
    if (geofenceChecked != null) {
      return geofenceChecked(this);
    }
    return orElse();
  }
}

abstract class _GeofenceChecked implements JobState {
  const factory _GeofenceChecked(final bool isWithinGeofence) =
      _$GeofenceCheckedImpl;

  bool get isWithinGeofence;
  @JsonKey(ignore: true)
  _$$GeofenceCheckedImplCopyWith<_$GeofenceCheckedImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$GeofenceErrorImplCopyWith<$Res> {
  factory _$$GeofenceErrorImplCopyWith(
          _$GeofenceErrorImpl value, $Res Function(_$GeofenceErrorImpl) then) =
      __$$GeofenceErrorImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$GeofenceErrorImplCopyWithImpl<$Res>
    extends _$JobStateCopyWithImpl<$Res, _$GeofenceErrorImpl>
    implements _$$GeofenceErrorImplCopyWith<$Res> {
  __$$GeofenceErrorImplCopyWithImpl(
      _$GeofenceErrorImpl _value, $Res Function(_$GeofenceErrorImpl) _then)
      : super(_value, _then);
}

/// @nodoc

class _$GeofenceErrorImpl implements _GeofenceError {
  const _$GeofenceErrorImpl();

  @override
  String toString() {
    return 'JobState.geofenceError()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$GeofenceErrorImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() loading,
    required TResult Function(String message) error,
    required TResult Function(List<Job> jobs) loaded,
    required TResult Function(Job job) jobStarted,
    required TResult Function(Job job) taskCompleted,
    required TResult Function(List<String> urls) photosUploaded,
    required TResult Function(bool isWithinGeofence) geofenceChecked,
    required TResult Function() geofenceError,
  }) {
    return geofenceError();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? loading,
    TResult? Function(String message)? error,
    TResult? Function(List<Job> jobs)? loaded,
    TResult? Function(Job job)? jobStarted,
    TResult? Function(Job job)? taskCompleted,
    TResult? Function(List<String> urls)? photosUploaded,
    TResult? Function(bool isWithinGeofence)? geofenceChecked,
    TResult? Function()? geofenceError,
  }) {
    return geofenceError?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function(String message)? error,
    TResult Function(List<Job> jobs)? loaded,
    TResult Function(Job job)? jobStarted,
    TResult Function(Job job)? taskCompleted,
    TResult Function(List<String> urls)? photosUploaded,
    TResult Function(bool isWithinGeofence)? geofenceChecked,
    TResult Function()? geofenceError,
    required TResult orElse(),
  }) {
    if (geofenceError != null) {
      return geofenceError();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initial value) initial,
    required TResult Function(_Loading value) loading,
    required TResult Function(_Error value) error,
    required TResult Function(_Loaded value) loaded,
    required TResult Function(_JobStarted value) jobStarted,
    required TResult Function(_TaskCompleted value) taskCompleted,
    required TResult Function(_PhotosUploaded value) photosUploaded,
    required TResult Function(_GeofenceChecked value) geofenceChecked,
    required TResult Function(_GeofenceError value) geofenceError,
  }) {
    return geofenceError(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initial value)? initial,
    TResult? Function(_Loading value)? loading,
    TResult? Function(_Error value)? error,
    TResult? Function(_Loaded value)? loaded,
    TResult? Function(_JobStarted value)? jobStarted,
    TResult? Function(_TaskCompleted value)? taskCompleted,
    TResult? Function(_PhotosUploaded value)? photosUploaded,
    TResult? Function(_GeofenceChecked value)? geofenceChecked,
    TResult? Function(_GeofenceError value)? geofenceError,
  }) {
    return geofenceError?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    TResult Function(_Loading value)? loading,
    TResult Function(_Error value)? error,
    TResult Function(_Loaded value)? loaded,
    TResult Function(_JobStarted value)? jobStarted,
    TResult Function(_TaskCompleted value)? taskCompleted,
    TResult Function(_PhotosUploaded value)? photosUploaded,
    TResult Function(_GeofenceChecked value)? geofenceChecked,
    TResult Function(_GeofenceError value)? geofenceError,
    required TResult orElse(),
  }) {
    if (geofenceError != null) {
      return geofenceError(this);
    }
    return orElse();
  }
}

abstract class _GeofenceError implements JobState {
  const factory _GeofenceError() = _$GeofenceErrorImpl;
}
