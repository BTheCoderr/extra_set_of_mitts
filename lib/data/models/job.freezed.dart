// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'job.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

Job _$JobFromJson(Map<String, dynamic> json) {
  return _Job.fromJson(json);
}

/// @nodoc
mixin _$Job {
  String get id => throw _privateConstructorUsedError;
  String get customerId => throw _privateConstructorUsedError;
  String get customerName => throw _privateConstructorUsedError;
  String get address => throw _privateConstructorUsedError;
  DateTime get scheduledStartTime => throw _privateConstructorUsedError;
  DateTime get scheduledEndTime => throw _privateConstructorUsedError;
  List<String> get assignedContractors => throw _privateConstructorUsedError;
  JobStatus get status => throw _privateConstructorUsedError;
  List<CleaningTask> get tasks => throw _privateConstructorUsedError;
  String? get notes => throw _privateConstructorUsedError;
  DateTime? get actualStartTime => throw _privateConstructorUsedError;
  DateTime? get actualEndTime => throw _privateConstructorUsedError;
  bool get requiresKey => throw _privateConstructorUsedError;
  bool get photosRequired => throw _privateConstructorUsedError;
  GeoLocation? get location => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $JobCopyWith<Job> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $JobCopyWith<$Res> {
  factory $JobCopyWith(Job value, $Res Function(Job) then) =
      _$JobCopyWithImpl<$Res, Job>;
  @useResult
  $Res call(
      {String id,
      String customerId,
      String customerName,
      String address,
      DateTime scheduledStartTime,
      DateTime scheduledEndTime,
      List<String> assignedContractors,
      JobStatus status,
      List<CleaningTask> tasks,
      String? notes,
      DateTime? actualStartTime,
      DateTime? actualEndTime,
      bool requiresKey,
      bool photosRequired,
      GeoLocation? location});

  $GeoLocationCopyWith<$Res>? get location;
}

/// @nodoc
class _$JobCopyWithImpl<$Res, $Val extends Job> implements $JobCopyWith<$Res> {
  _$JobCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? customerId = null,
    Object? customerName = null,
    Object? address = null,
    Object? scheduledStartTime = null,
    Object? scheduledEndTime = null,
    Object? assignedContractors = null,
    Object? status = null,
    Object? tasks = null,
    Object? notes = freezed,
    Object? actualStartTime = freezed,
    Object? actualEndTime = freezed,
    Object? requiresKey = null,
    Object? photosRequired = null,
    Object? location = freezed,
  }) {
    return _then(_value.copyWith(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      customerId: null == customerId
          ? _value.customerId
          : customerId // ignore: cast_nullable_to_non_nullable
              as String,
      customerName: null == customerName
          ? _value.customerName
          : customerName // ignore: cast_nullable_to_non_nullable
              as String,
      address: null == address
          ? _value.address
          : address // ignore: cast_nullable_to_non_nullable
              as String,
      scheduledStartTime: null == scheduledStartTime
          ? _value.scheduledStartTime
          : scheduledStartTime // ignore: cast_nullable_to_non_nullable
              as DateTime,
      scheduledEndTime: null == scheduledEndTime
          ? _value.scheduledEndTime
          : scheduledEndTime // ignore: cast_nullable_to_non_nullable
              as DateTime,
      assignedContractors: null == assignedContractors
          ? _value.assignedContractors
          : assignedContractors // ignore: cast_nullable_to_non_nullable
              as List<String>,
      status: null == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as JobStatus,
      tasks: null == tasks
          ? _value.tasks
          : tasks // ignore: cast_nullable_to_non_nullable
              as List<CleaningTask>,
      notes: freezed == notes
          ? _value.notes
          : notes // ignore: cast_nullable_to_non_nullable
              as String?,
      actualStartTime: freezed == actualStartTime
          ? _value.actualStartTime
          : actualStartTime // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      actualEndTime: freezed == actualEndTime
          ? _value.actualEndTime
          : actualEndTime // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      requiresKey: null == requiresKey
          ? _value.requiresKey
          : requiresKey // ignore: cast_nullable_to_non_nullable
              as bool,
      photosRequired: null == photosRequired
          ? _value.photosRequired
          : photosRequired // ignore: cast_nullable_to_non_nullable
              as bool,
      location: freezed == location
          ? _value.location
          : location // ignore: cast_nullable_to_non_nullable
              as GeoLocation?,
    ) as $Val);
  }

  @override
  @pragma('vm:prefer-inline')
  $GeoLocationCopyWith<$Res>? get location {
    if (_value.location == null) {
      return null;
    }

    return $GeoLocationCopyWith<$Res>(_value.location!, (value) {
      return _then(_value.copyWith(location: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$JobImplCopyWith<$Res> implements $JobCopyWith<$Res> {
  factory _$$JobImplCopyWith(_$JobImpl value, $Res Function(_$JobImpl) then) =
      __$$JobImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String id,
      String customerId,
      String customerName,
      String address,
      DateTime scheduledStartTime,
      DateTime scheduledEndTime,
      List<String> assignedContractors,
      JobStatus status,
      List<CleaningTask> tasks,
      String? notes,
      DateTime? actualStartTime,
      DateTime? actualEndTime,
      bool requiresKey,
      bool photosRequired,
      GeoLocation? location});

  @override
  $GeoLocationCopyWith<$Res>? get location;
}

/// @nodoc
class __$$JobImplCopyWithImpl<$Res> extends _$JobCopyWithImpl<$Res, _$JobImpl>
    implements _$$JobImplCopyWith<$Res> {
  __$$JobImplCopyWithImpl(_$JobImpl _value, $Res Function(_$JobImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? customerId = null,
    Object? customerName = null,
    Object? address = null,
    Object? scheduledStartTime = null,
    Object? scheduledEndTime = null,
    Object? assignedContractors = null,
    Object? status = null,
    Object? tasks = null,
    Object? notes = freezed,
    Object? actualStartTime = freezed,
    Object? actualEndTime = freezed,
    Object? requiresKey = null,
    Object? photosRequired = null,
    Object? location = freezed,
  }) {
    return _then(_$JobImpl(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      customerId: null == customerId
          ? _value.customerId
          : customerId // ignore: cast_nullable_to_non_nullable
              as String,
      customerName: null == customerName
          ? _value.customerName
          : customerName // ignore: cast_nullable_to_non_nullable
              as String,
      address: null == address
          ? _value.address
          : address // ignore: cast_nullable_to_non_nullable
              as String,
      scheduledStartTime: null == scheduledStartTime
          ? _value.scheduledStartTime
          : scheduledStartTime // ignore: cast_nullable_to_non_nullable
              as DateTime,
      scheduledEndTime: null == scheduledEndTime
          ? _value.scheduledEndTime
          : scheduledEndTime // ignore: cast_nullable_to_non_nullable
              as DateTime,
      assignedContractors: null == assignedContractors
          ? _value._assignedContractors
          : assignedContractors // ignore: cast_nullable_to_non_nullable
              as List<String>,
      status: null == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as JobStatus,
      tasks: null == tasks
          ? _value._tasks
          : tasks // ignore: cast_nullable_to_non_nullable
              as List<CleaningTask>,
      notes: freezed == notes
          ? _value.notes
          : notes // ignore: cast_nullable_to_non_nullable
              as String?,
      actualStartTime: freezed == actualStartTime
          ? _value.actualStartTime
          : actualStartTime // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      actualEndTime: freezed == actualEndTime
          ? _value.actualEndTime
          : actualEndTime // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      requiresKey: null == requiresKey
          ? _value.requiresKey
          : requiresKey // ignore: cast_nullable_to_non_nullable
              as bool,
      photosRequired: null == photosRequired
          ? _value.photosRequired
          : photosRequired // ignore: cast_nullable_to_non_nullable
              as bool,
      location: freezed == location
          ? _value.location
          : location // ignore: cast_nullable_to_non_nullable
              as GeoLocation?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$JobImpl with DiagnosticableTreeMixin implements _Job {
  const _$JobImpl(
      {required this.id,
      required this.customerId,
      required this.customerName,
      required this.address,
      required this.scheduledStartTime,
      required this.scheduledEndTime,
      required final List<String> assignedContractors,
      required this.status,
      required final List<CleaningTask> tasks,
      this.notes,
      this.actualStartTime,
      this.actualEndTime,
      this.requiresKey = false,
      this.photosRequired = false,
      this.location})
      : _assignedContractors = assignedContractors,
        _tasks = tasks;

  factory _$JobImpl.fromJson(Map<String, dynamic> json) =>
      _$$JobImplFromJson(json);

  @override
  final String id;
  @override
  final String customerId;
  @override
  final String customerName;
  @override
  final String address;
  @override
  final DateTime scheduledStartTime;
  @override
  final DateTime scheduledEndTime;
  final List<String> _assignedContractors;
  @override
  List<String> get assignedContractors {
    if (_assignedContractors is EqualUnmodifiableListView)
      return _assignedContractors;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_assignedContractors);
  }

  @override
  final JobStatus status;
  final List<CleaningTask> _tasks;
  @override
  List<CleaningTask> get tasks {
    if (_tasks is EqualUnmodifiableListView) return _tasks;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_tasks);
  }

  @override
  final String? notes;
  @override
  final DateTime? actualStartTime;
  @override
  final DateTime? actualEndTime;
  @override
  @JsonKey()
  final bool requiresKey;
  @override
  @JsonKey()
  final bool photosRequired;
  @override
  final GeoLocation? location;

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'Job(id: $id, customerId: $customerId, customerName: $customerName, address: $address, scheduledStartTime: $scheduledStartTime, scheduledEndTime: $scheduledEndTime, assignedContractors: $assignedContractors, status: $status, tasks: $tasks, notes: $notes, actualStartTime: $actualStartTime, actualEndTime: $actualEndTime, requiresKey: $requiresKey, photosRequired: $photosRequired, location: $location)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'Job'))
      ..add(DiagnosticsProperty('id', id))
      ..add(DiagnosticsProperty('customerId', customerId))
      ..add(DiagnosticsProperty('customerName', customerName))
      ..add(DiagnosticsProperty('address', address))
      ..add(DiagnosticsProperty('scheduledStartTime', scheduledStartTime))
      ..add(DiagnosticsProperty('scheduledEndTime', scheduledEndTime))
      ..add(DiagnosticsProperty('assignedContractors', assignedContractors))
      ..add(DiagnosticsProperty('status', status))
      ..add(DiagnosticsProperty('tasks', tasks))
      ..add(DiagnosticsProperty('notes', notes))
      ..add(DiagnosticsProperty('actualStartTime', actualStartTime))
      ..add(DiagnosticsProperty('actualEndTime', actualEndTime))
      ..add(DiagnosticsProperty('requiresKey', requiresKey))
      ..add(DiagnosticsProperty('photosRequired', photosRequired))
      ..add(DiagnosticsProperty('location', location));
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$JobImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.customerId, customerId) ||
                other.customerId == customerId) &&
            (identical(other.customerName, customerName) ||
                other.customerName == customerName) &&
            (identical(other.address, address) || other.address == address) &&
            (identical(other.scheduledStartTime, scheduledStartTime) ||
                other.scheduledStartTime == scheduledStartTime) &&
            (identical(other.scheduledEndTime, scheduledEndTime) ||
                other.scheduledEndTime == scheduledEndTime) &&
            const DeepCollectionEquality()
                .equals(other._assignedContractors, _assignedContractors) &&
            (identical(other.status, status) || other.status == status) &&
            const DeepCollectionEquality().equals(other._tasks, _tasks) &&
            (identical(other.notes, notes) || other.notes == notes) &&
            (identical(other.actualStartTime, actualStartTime) ||
                other.actualStartTime == actualStartTime) &&
            (identical(other.actualEndTime, actualEndTime) ||
                other.actualEndTime == actualEndTime) &&
            (identical(other.requiresKey, requiresKey) ||
                other.requiresKey == requiresKey) &&
            (identical(other.photosRequired, photosRequired) ||
                other.photosRequired == photosRequired) &&
            (identical(other.location, location) ||
                other.location == location));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      id,
      customerId,
      customerName,
      address,
      scheduledStartTime,
      scheduledEndTime,
      const DeepCollectionEquality().hash(_assignedContractors),
      status,
      const DeepCollectionEquality().hash(_tasks),
      notes,
      actualStartTime,
      actualEndTime,
      requiresKey,
      photosRequired,
      location);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$JobImplCopyWith<_$JobImpl> get copyWith =>
      __$$JobImplCopyWithImpl<_$JobImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$JobImplToJson(
      this,
    );
  }
}

abstract class _Job implements Job {
  const factory _Job(
      {required final String id,
      required final String customerId,
      required final String customerName,
      required final String address,
      required final DateTime scheduledStartTime,
      required final DateTime scheduledEndTime,
      required final List<String> assignedContractors,
      required final JobStatus status,
      required final List<CleaningTask> tasks,
      final String? notes,
      final DateTime? actualStartTime,
      final DateTime? actualEndTime,
      final bool requiresKey,
      final bool photosRequired,
      final GeoLocation? location}) = _$JobImpl;

  factory _Job.fromJson(Map<String, dynamic> json) = _$JobImpl.fromJson;

  @override
  String get id;
  @override
  String get customerId;
  @override
  String get customerName;
  @override
  String get address;
  @override
  DateTime get scheduledStartTime;
  @override
  DateTime get scheduledEndTime;
  @override
  List<String> get assignedContractors;
  @override
  JobStatus get status;
  @override
  List<CleaningTask> get tasks;
  @override
  String? get notes;
  @override
  DateTime? get actualStartTime;
  @override
  DateTime? get actualEndTime;
  @override
  bool get requiresKey;
  @override
  bool get photosRequired;
  @override
  GeoLocation? get location;
  @override
  @JsonKey(ignore: true)
  _$$JobImplCopyWith<_$JobImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

CleaningTask _$CleaningTaskFromJson(Map<String, dynamic> json) {
  return _CleaningTask.fromJson(json);
}

/// @nodoc
mixin _$CleaningTask {
  String get id => throw _privateConstructorUsedError;
  String get name => throw _privateConstructorUsedError;
  bool get isCompleted => throw _privateConstructorUsedError;
  TaskType get type => throw _privateConstructorUsedError;
  String? get notes => throw _privateConstructorUsedError;
  List<String>? get photoUrls => throw _privateConstructorUsedError;
  DateTime? get completedAt => throw _privateConstructorUsedError;
  String? get completedBy => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $CleaningTaskCopyWith<CleaningTask> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $CleaningTaskCopyWith<$Res> {
  factory $CleaningTaskCopyWith(
          CleaningTask value, $Res Function(CleaningTask) then) =
      _$CleaningTaskCopyWithImpl<$Res, CleaningTask>;
  @useResult
  $Res call(
      {String id,
      String name,
      bool isCompleted,
      TaskType type,
      String? notes,
      List<String>? photoUrls,
      DateTime? completedAt,
      String? completedBy});
}

/// @nodoc
class _$CleaningTaskCopyWithImpl<$Res, $Val extends CleaningTask>
    implements $CleaningTaskCopyWith<$Res> {
  _$CleaningTaskCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? name = null,
    Object? isCompleted = null,
    Object? type = null,
    Object? notes = freezed,
    Object? photoUrls = freezed,
    Object? completedAt = freezed,
    Object? completedBy = freezed,
  }) {
    return _then(_value.copyWith(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      isCompleted: null == isCompleted
          ? _value.isCompleted
          : isCompleted // ignore: cast_nullable_to_non_nullable
              as bool,
      type: null == type
          ? _value.type
          : type // ignore: cast_nullable_to_non_nullable
              as TaskType,
      notes: freezed == notes
          ? _value.notes
          : notes // ignore: cast_nullable_to_non_nullable
              as String?,
      photoUrls: freezed == photoUrls
          ? _value.photoUrls
          : photoUrls // ignore: cast_nullable_to_non_nullable
              as List<String>?,
      completedAt: freezed == completedAt
          ? _value.completedAt
          : completedAt // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      completedBy: freezed == completedBy
          ? _value.completedBy
          : completedBy // ignore: cast_nullable_to_non_nullable
              as String?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$CleaningTaskImplCopyWith<$Res>
    implements $CleaningTaskCopyWith<$Res> {
  factory _$$CleaningTaskImplCopyWith(
          _$CleaningTaskImpl value, $Res Function(_$CleaningTaskImpl) then) =
      __$$CleaningTaskImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String id,
      String name,
      bool isCompleted,
      TaskType type,
      String? notes,
      List<String>? photoUrls,
      DateTime? completedAt,
      String? completedBy});
}

/// @nodoc
class __$$CleaningTaskImplCopyWithImpl<$Res>
    extends _$CleaningTaskCopyWithImpl<$Res, _$CleaningTaskImpl>
    implements _$$CleaningTaskImplCopyWith<$Res> {
  __$$CleaningTaskImplCopyWithImpl(
      _$CleaningTaskImpl _value, $Res Function(_$CleaningTaskImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? name = null,
    Object? isCompleted = null,
    Object? type = null,
    Object? notes = freezed,
    Object? photoUrls = freezed,
    Object? completedAt = freezed,
    Object? completedBy = freezed,
  }) {
    return _then(_$CleaningTaskImpl(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      isCompleted: null == isCompleted
          ? _value.isCompleted
          : isCompleted // ignore: cast_nullable_to_non_nullable
              as bool,
      type: null == type
          ? _value.type
          : type // ignore: cast_nullable_to_non_nullable
              as TaskType,
      notes: freezed == notes
          ? _value.notes
          : notes // ignore: cast_nullable_to_non_nullable
              as String?,
      photoUrls: freezed == photoUrls
          ? _value._photoUrls
          : photoUrls // ignore: cast_nullable_to_non_nullable
              as List<String>?,
      completedAt: freezed == completedAt
          ? _value.completedAt
          : completedAt // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      completedBy: freezed == completedBy
          ? _value.completedBy
          : completedBy // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$CleaningTaskImpl with DiagnosticableTreeMixin implements _CleaningTask {
  const _$CleaningTaskImpl(
      {required this.id,
      required this.name,
      required this.isCompleted,
      required this.type,
      this.notes,
      final List<String>? photoUrls,
      this.completedAt,
      this.completedBy})
      : _photoUrls = photoUrls;

  factory _$CleaningTaskImpl.fromJson(Map<String, dynamic> json) =>
      _$$CleaningTaskImplFromJson(json);

  @override
  final String id;
  @override
  final String name;
  @override
  final bool isCompleted;
  @override
  final TaskType type;
  @override
  final String? notes;
  final List<String>? _photoUrls;
  @override
  List<String>? get photoUrls {
    final value = _photoUrls;
    if (value == null) return null;
    if (_photoUrls is EqualUnmodifiableListView) return _photoUrls;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  @override
  final DateTime? completedAt;
  @override
  final String? completedBy;

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'CleaningTask(id: $id, name: $name, isCompleted: $isCompleted, type: $type, notes: $notes, photoUrls: $photoUrls, completedAt: $completedAt, completedBy: $completedBy)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'CleaningTask'))
      ..add(DiagnosticsProperty('id', id))
      ..add(DiagnosticsProperty('name', name))
      ..add(DiagnosticsProperty('isCompleted', isCompleted))
      ..add(DiagnosticsProperty('type', type))
      ..add(DiagnosticsProperty('notes', notes))
      ..add(DiagnosticsProperty('photoUrls', photoUrls))
      ..add(DiagnosticsProperty('completedAt', completedAt))
      ..add(DiagnosticsProperty('completedBy', completedBy));
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$CleaningTaskImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.isCompleted, isCompleted) ||
                other.isCompleted == isCompleted) &&
            (identical(other.type, type) || other.type == type) &&
            (identical(other.notes, notes) || other.notes == notes) &&
            const DeepCollectionEquality()
                .equals(other._photoUrls, _photoUrls) &&
            (identical(other.completedAt, completedAt) ||
                other.completedAt == completedAt) &&
            (identical(other.completedBy, completedBy) ||
                other.completedBy == completedBy));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      id,
      name,
      isCompleted,
      type,
      notes,
      const DeepCollectionEquality().hash(_photoUrls),
      completedAt,
      completedBy);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$CleaningTaskImplCopyWith<_$CleaningTaskImpl> get copyWith =>
      __$$CleaningTaskImplCopyWithImpl<_$CleaningTaskImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$CleaningTaskImplToJson(
      this,
    );
  }
}

abstract class _CleaningTask implements CleaningTask {
  const factory _CleaningTask(
      {required final String id,
      required final String name,
      required final bool isCompleted,
      required final TaskType type,
      final String? notes,
      final List<String>? photoUrls,
      final DateTime? completedAt,
      final String? completedBy}) = _$CleaningTaskImpl;

  factory _CleaningTask.fromJson(Map<String, dynamic> json) =
      _$CleaningTaskImpl.fromJson;

  @override
  String get id;
  @override
  String get name;
  @override
  bool get isCompleted;
  @override
  TaskType get type;
  @override
  String? get notes;
  @override
  List<String>? get photoUrls;
  @override
  DateTime? get completedAt;
  @override
  String? get completedBy;
  @override
  @JsonKey(ignore: true)
  _$$CleaningTaskImplCopyWith<_$CleaningTaskImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

GeoLocation _$GeoLocationFromJson(Map<String, dynamic> json) {
  return _GeoLocation.fromJson(json);
}

/// @nodoc
mixin _$GeoLocation {
  double get latitude => throw _privateConstructorUsedError;
  double get longitude => throw _privateConstructorUsedError;
  double? get accuracy => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $GeoLocationCopyWith<GeoLocation> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $GeoLocationCopyWith<$Res> {
  factory $GeoLocationCopyWith(
          GeoLocation value, $Res Function(GeoLocation) then) =
      _$GeoLocationCopyWithImpl<$Res, GeoLocation>;
  @useResult
  $Res call({double latitude, double longitude, double? accuracy});
}

/// @nodoc
class _$GeoLocationCopyWithImpl<$Res, $Val extends GeoLocation>
    implements $GeoLocationCopyWith<$Res> {
  _$GeoLocationCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? latitude = null,
    Object? longitude = null,
    Object? accuracy = freezed,
  }) {
    return _then(_value.copyWith(
      latitude: null == latitude
          ? _value.latitude
          : latitude // ignore: cast_nullable_to_non_nullable
              as double,
      longitude: null == longitude
          ? _value.longitude
          : longitude // ignore: cast_nullable_to_non_nullable
              as double,
      accuracy: freezed == accuracy
          ? _value.accuracy
          : accuracy // ignore: cast_nullable_to_non_nullable
              as double?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$GeoLocationImplCopyWith<$Res>
    implements $GeoLocationCopyWith<$Res> {
  factory _$$GeoLocationImplCopyWith(
          _$GeoLocationImpl value, $Res Function(_$GeoLocationImpl) then) =
      __$$GeoLocationImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({double latitude, double longitude, double? accuracy});
}

/// @nodoc
class __$$GeoLocationImplCopyWithImpl<$Res>
    extends _$GeoLocationCopyWithImpl<$Res, _$GeoLocationImpl>
    implements _$$GeoLocationImplCopyWith<$Res> {
  __$$GeoLocationImplCopyWithImpl(
      _$GeoLocationImpl _value, $Res Function(_$GeoLocationImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? latitude = null,
    Object? longitude = null,
    Object? accuracy = freezed,
  }) {
    return _then(_$GeoLocationImpl(
      latitude: null == latitude
          ? _value.latitude
          : latitude // ignore: cast_nullable_to_non_nullable
              as double,
      longitude: null == longitude
          ? _value.longitude
          : longitude // ignore: cast_nullable_to_non_nullable
              as double,
      accuracy: freezed == accuracy
          ? _value.accuracy
          : accuracy // ignore: cast_nullable_to_non_nullable
              as double?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$GeoLocationImpl with DiagnosticableTreeMixin implements _GeoLocation {
  const _$GeoLocationImpl(
      {required this.latitude, required this.longitude, this.accuracy});

  factory _$GeoLocationImpl.fromJson(Map<String, dynamic> json) =>
      _$$GeoLocationImplFromJson(json);

  @override
  final double latitude;
  @override
  final double longitude;
  @override
  final double? accuracy;

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'GeoLocation(latitude: $latitude, longitude: $longitude, accuracy: $accuracy)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'GeoLocation'))
      ..add(DiagnosticsProperty('latitude', latitude))
      ..add(DiagnosticsProperty('longitude', longitude))
      ..add(DiagnosticsProperty('accuracy', accuracy));
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$GeoLocationImpl &&
            (identical(other.latitude, latitude) ||
                other.latitude == latitude) &&
            (identical(other.longitude, longitude) ||
                other.longitude == longitude) &&
            (identical(other.accuracy, accuracy) ||
                other.accuracy == accuracy));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, latitude, longitude, accuracy);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$GeoLocationImplCopyWith<_$GeoLocationImpl> get copyWith =>
      __$$GeoLocationImplCopyWithImpl<_$GeoLocationImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$GeoLocationImplToJson(
      this,
    );
  }
}

abstract class _GeoLocation implements GeoLocation {
  const factory _GeoLocation(
      {required final double latitude,
      required final double longitude,
      final double? accuracy}) = _$GeoLocationImpl;

  factory _GeoLocation.fromJson(Map<String, dynamic> json) =
      _$GeoLocationImpl.fromJson;

  @override
  double get latitude;
  @override
  double get longitude;
  @override
  double? get accuracy;
  @override
  @JsonKey(ignore: true)
  _$$GeoLocationImplCopyWith<_$GeoLocationImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
