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

JobModel _$JobModelFromJson(Map<String, dynamic> json) {
  return _JobModel.fromJson(json);
}

/// @nodoc
mixin _$JobModel {
  @HiveField(0)
  String get id => throw _privateConstructorUsedError;
  @HiveField(1)
  String get customerId => throw _privateConstructorUsedError;
  @HiveField(2)
  String get customerName => throw _privateConstructorUsedError;
  @HiveField(3)
  String get address => throw _privateConstructorUsedError;
  @HiveField(4)
  DateTime get scheduledStartTime => throw _privateConstructorUsedError;
  @HiveField(5)
  DateTime get scheduledEndTime => throw _privateConstructorUsedError;
  @HiveField(6)
  List<String> get assignedContractors => throw _privateConstructorUsedError;
  @HiveField(7)
  JobStatus get status => throw _privateConstructorUsedError;
  @HiveField(8)
  List<CleaningTask> get tasks => throw _privateConstructorUsedError;
  @HiveField(9)
  String? get notes => throw _privateConstructorUsedError;
  @HiveField(10)
  DateTime? get actualStartTime => throw _privateConstructorUsedError;
  @HiveField(11)
  DateTime? get actualEndTime => throw _privateConstructorUsedError;
  @HiveField(12)
  bool get photosRequired => throw _privateConstructorUsedError;
  @HiveField(13)
  GeoLocation? get location => throw _privateConstructorUsedError;
  @HiveField(14)
  DateTime get createdAt => throw _privateConstructorUsedError;
  @HiveField(15)
  DateTime? get completedAt => throw _privateConstructorUsedError;

  /// Serializes this JobModel to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of JobModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $JobModelCopyWith<JobModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $JobModelCopyWith<$Res> {
  factory $JobModelCopyWith(JobModel value, $Res Function(JobModel) then) =
      _$JobModelCopyWithImpl<$Res, JobModel>;
  @useResult
  $Res call(
      {@HiveField(0) String id,
      @HiveField(1) String customerId,
      @HiveField(2) String customerName,
      @HiveField(3) String address,
      @HiveField(4) DateTime scheduledStartTime,
      @HiveField(5) DateTime scheduledEndTime,
      @HiveField(6) List<String> assignedContractors,
      @HiveField(7) JobStatus status,
      @HiveField(8) List<CleaningTask> tasks,
      @HiveField(9) String? notes,
      @HiveField(10) DateTime? actualStartTime,
      @HiveField(11) DateTime? actualEndTime,
      @HiveField(12) bool photosRequired,
      @HiveField(13) GeoLocation? location,
      @HiveField(14) DateTime createdAt,
      @HiveField(15) DateTime? completedAt});
}

/// @nodoc
class _$JobModelCopyWithImpl<$Res, $Val extends JobModel>
    implements $JobModelCopyWith<$Res> {
  _$JobModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of JobModel
  /// with the given fields replaced by the non-null parameter values.
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
    Object? photosRequired = null,
    Object? location = freezed,
    Object? createdAt = null,
    Object? completedAt = freezed,
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
      photosRequired: null == photosRequired
          ? _value.photosRequired
          : photosRequired // ignore: cast_nullable_to_non_nullable
              as bool,
      location: freezed == location
          ? _value.location
          : location // ignore: cast_nullable_to_non_nullable
              as GeoLocation?,
      createdAt: null == createdAt
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as DateTime,
      completedAt: freezed == completedAt
          ? _value.completedAt
          : completedAt // ignore: cast_nullable_to_non_nullable
              as DateTime?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$JobModelImplCopyWith<$Res>
    implements $JobModelCopyWith<$Res> {
  factory _$$JobModelImplCopyWith(
          _$JobModelImpl value, $Res Function(_$JobModelImpl) then) =
      __$$JobModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@HiveField(0) String id,
      @HiveField(1) String customerId,
      @HiveField(2) String customerName,
      @HiveField(3) String address,
      @HiveField(4) DateTime scheduledStartTime,
      @HiveField(5) DateTime scheduledEndTime,
      @HiveField(6) List<String> assignedContractors,
      @HiveField(7) JobStatus status,
      @HiveField(8) List<CleaningTask> tasks,
      @HiveField(9) String? notes,
      @HiveField(10) DateTime? actualStartTime,
      @HiveField(11) DateTime? actualEndTime,
      @HiveField(12) bool photosRequired,
      @HiveField(13) GeoLocation? location,
      @HiveField(14) DateTime createdAt,
      @HiveField(15) DateTime? completedAt});
}

/// @nodoc
class __$$JobModelImplCopyWithImpl<$Res>
    extends _$JobModelCopyWithImpl<$Res, _$JobModelImpl>
    implements _$$JobModelImplCopyWith<$Res> {
  __$$JobModelImplCopyWithImpl(
      _$JobModelImpl _value, $Res Function(_$JobModelImpl) _then)
      : super(_value, _then);

  /// Create a copy of JobModel
  /// with the given fields replaced by the non-null parameter values.
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
    Object? photosRequired = null,
    Object? location = freezed,
    Object? createdAt = null,
    Object? completedAt = freezed,
  }) {
    return _then(_$JobModelImpl(
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
      photosRequired: null == photosRequired
          ? _value.photosRequired
          : photosRequired // ignore: cast_nullable_to_non_nullable
              as bool,
      location: freezed == location
          ? _value.location
          : location // ignore: cast_nullable_to_non_nullable
              as GeoLocation?,
      createdAt: null == createdAt
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as DateTime,
      completedAt: freezed == completedAt
          ? _value.completedAt
          : completedAt // ignore: cast_nullable_to_non_nullable
              as DateTime?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$JobModelImpl extends _JobModel {
  const _$JobModelImpl(
      {@HiveField(0) required this.id,
      @HiveField(1) required this.customerId,
      @HiveField(2) required this.customerName,
      @HiveField(3) required this.address,
      @HiveField(4) required this.scheduledStartTime,
      @HiveField(5) required this.scheduledEndTime,
      @HiveField(6) required final List<String> assignedContractors,
      @HiveField(7) required this.status,
      @HiveField(8) final List<CleaningTask> tasks = const [],
      @HiveField(9) this.notes,
      @HiveField(10) this.actualStartTime,
      @HiveField(11) this.actualEndTime,
      @HiveField(12) this.photosRequired = false,
      @HiveField(13) this.location,
      @HiveField(14) required this.createdAt,
      @HiveField(15) this.completedAt})
      : _assignedContractors = assignedContractors,
        _tasks = tasks,
        super._();

  factory _$JobModelImpl.fromJson(Map<String, dynamic> json) =>
      _$$JobModelImplFromJson(json);

  @override
  @HiveField(0)
  final String id;
  @override
  @HiveField(1)
  final String customerId;
  @override
  @HiveField(2)
  final String customerName;
  @override
  @HiveField(3)
  final String address;
  @override
  @HiveField(4)
  final DateTime scheduledStartTime;
  @override
  @HiveField(5)
  final DateTime scheduledEndTime;
  final List<String> _assignedContractors;
  @override
  @HiveField(6)
  List<String> get assignedContractors {
    if (_assignedContractors is EqualUnmodifiableListView)
      return _assignedContractors;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_assignedContractors);
  }

  @override
  @HiveField(7)
  final JobStatus status;
  final List<CleaningTask> _tasks;
  @override
  @JsonKey()
  @HiveField(8)
  List<CleaningTask> get tasks {
    if (_tasks is EqualUnmodifiableListView) return _tasks;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_tasks);
  }

  @override
  @HiveField(9)
  final String? notes;
  @override
  @HiveField(10)
  final DateTime? actualStartTime;
  @override
  @HiveField(11)
  final DateTime? actualEndTime;
  @override
  @JsonKey()
  @HiveField(12)
  final bool photosRequired;
  @override
  @HiveField(13)
  final GeoLocation? location;
  @override
  @HiveField(14)
  final DateTime createdAt;
  @override
  @HiveField(15)
  final DateTime? completedAt;

  /// Create a copy of JobModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$JobModelImplCopyWith<_$JobModelImpl> get copyWith =>
      __$$JobModelImplCopyWithImpl<_$JobModelImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$JobModelImplToJson(
      this,
    );
  }
}

abstract class _JobModel extends JobModel {
  const factory _JobModel(
      {@HiveField(0) required final String id,
      @HiveField(1) required final String customerId,
      @HiveField(2) required final String customerName,
      @HiveField(3) required final String address,
      @HiveField(4) required final DateTime scheduledStartTime,
      @HiveField(5) required final DateTime scheduledEndTime,
      @HiveField(6) required final List<String> assignedContractors,
      @HiveField(7) required final JobStatus status,
      @HiveField(8) final List<CleaningTask> tasks,
      @HiveField(9) final String? notes,
      @HiveField(10) final DateTime? actualStartTime,
      @HiveField(11) final DateTime? actualEndTime,
      @HiveField(12) final bool photosRequired,
      @HiveField(13) final GeoLocation? location,
      @HiveField(14) required final DateTime createdAt,
      @HiveField(15) final DateTime? completedAt}) = _$JobModelImpl;
  const _JobModel._() : super._();

  factory _JobModel.fromJson(Map<String, dynamic> json) =
      _$JobModelImpl.fromJson;

  @override
  @HiveField(0)
  String get id;
  @override
  @HiveField(1)
  String get customerId;
  @override
  @HiveField(2)
  String get customerName;
  @override
  @HiveField(3)
  String get address;
  @override
  @HiveField(4)
  DateTime get scheduledStartTime;
  @override
  @HiveField(5)
  DateTime get scheduledEndTime;
  @override
  @HiveField(6)
  List<String> get assignedContractors;
  @override
  @HiveField(7)
  JobStatus get status;
  @override
  @HiveField(8)
  List<CleaningTask> get tasks;
  @override
  @HiveField(9)
  String? get notes;
  @override
  @HiveField(10)
  DateTime? get actualStartTime;
  @override
  @HiveField(11)
  DateTime? get actualEndTime;
  @override
  @HiveField(12)
  bool get photosRequired;
  @override
  @HiveField(13)
  GeoLocation? get location;
  @override
  @HiveField(14)
  DateTime get createdAt;
  @override
  @HiveField(15)
  DateTime? get completedAt;

  /// Create a copy of JobModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$JobModelImplCopyWith<_$JobModelImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

CleaningTask _$CleaningTaskFromJson(Map<String, dynamic> json) {
  return _CleaningTask.fromJson(json);
}

/// @nodoc
mixin _$CleaningTask {
  @HiveField(0)
  String get id => throw _privateConstructorUsedError;
  @HiveField(1)
  String get title => throw _privateConstructorUsedError;
  @HiveField(2)
  String get description => throw _privateConstructorUsedError;
  @HiveField(3)
  bool get isCompleted => throw _privateConstructorUsedError;
  @HiveField(4)
  String? get completedBy => throw _privateConstructorUsedError;
  @HiveField(5)
  DateTime? get completedAt => throw _privateConstructorUsedError;
  @HiveField(6)
  List<String>? get photoUrls => throw _privateConstructorUsedError;
  @HiveField(7)
  List<String>? get pendingPhotos => throw _privateConstructorUsedError;

  /// Serializes this CleaningTask to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of CleaningTask
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
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
      {@HiveField(0) String id,
      @HiveField(1) String title,
      @HiveField(2) String description,
      @HiveField(3) bool isCompleted,
      @HiveField(4) String? completedBy,
      @HiveField(5) DateTime? completedAt,
      @HiveField(6) List<String>? photoUrls,
      @HiveField(7) List<String>? pendingPhotos});
}

/// @nodoc
class _$CleaningTaskCopyWithImpl<$Res, $Val extends CleaningTask>
    implements $CleaningTaskCopyWith<$Res> {
  _$CleaningTaskCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of CleaningTask
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? title = null,
    Object? description = null,
    Object? isCompleted = null,
    Object? completedBy = freezed,
    Object? completedAt = freezed,
    Object? photoUrls = freezed,
    Object? pendingPhotos = freezed,
  }) {
    return _then(_value.copyWith(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      title: null == title
          ? _value.title
          : title // ignore: cast_nullable_to_non_nullable
              as String,
      description: null == description
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as String,
      isCompleted: null == isCompleted
          ? _value.isCompleted
          : isCompleted // ignore: cast_nullable_to_non_nullable
              as bool,
      completedBy: freezed == completedBy
          ? _value.completedBy
          : completedBy // ignore: cast_nullable_to_non_nullable
              as String?,
      completedAt: freezed == completedAt
          ? _value.completedAt
          : completedAt // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      photoUrls: freezed == photoUrls
          ? _value.photoUrls
          : photoUrls // ignore: cast_nullable_to_non_nullable
              as List<String>?,
      pendingPhotos: freezed == pendingPhotos
          ? _value.pendingPhotos
          : pendingPhotos // ignore: cast_nullable_to_non_nullable
              as List<String>?,
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
      {@HiveField(0) String id,
      @HiveField(1) String title,
      @HiveField(2) String description,
      @HiveField(3) bool isCompleted,
      @HiveField(4) String? completedBy,
      @HiveField(5) DateTime? completedAt,
      @HiveField(6) List<String>? photoUrls,
      @HiveField(7) List<String>? pendingPhotos});
}

/// @nodoc
class __$$CleaningTaskImplCopyWithImpl<$Res>
    extends _$CleaningTaskCopyWithImpl<$Res, _$CleaningTaskImpl>
    implements _$$CleaningTaskImplCopyWith<$Res> {
  __$$CleaningTaskImplCopyWithImpl(
      _$CleaningTaskImpl _value, $Res Function(_$CleaningTaskImpl) _then)
      : super(_value, _then);

  /// Create a copy of CleaningTask
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? title = null,
    Object? description = null,
    Object? isCompleted = null,
    Object? completedBy = freezed,
    Object? completedAt = freezed,
    Object? photoUrls = freezed,
    Object? pendingPhotos = freezed,
  }) {
    return _then(_$CleaningTaskImpl(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      title: null == title
          ? _value.title
          : title // ignore: cast_nullable_to_non_nullable
              as String,
      description: null == description
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as String,
      isCompleted: null == isCompleted
          ? _value.isCompleted
          : isCompleted // ignore: cast_nullable_to_non_nullable
              as bool,
      completedBy: freezed == completedBy
          ? _value.completedBy
          : completedBy // ignore: cast_nullable_to_non_nullable
              as String?,
      completedAt: freezed == completedAt
          ? _value.completedAt
          : completedAt // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      photoUrls: freezed == photoUrls
          ? _value._photoUrls
          : photoUrls // ignore: cast_nullable_to_non_nullable
              as List<String>?,
      pendingPhotos: freezed == pendingPhotos
          ? _value._pendingPhotos
          : pendingPhotos // ignore: cast_nullable_to_non_nullable
              as List<String>?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$CleaningTaskImpl extends _CleaningTask {
  const _$CleaningTaskImpl(
      {@HiveField(0) required this.id,
      @HiveField(1) required this.title,
      @HiveField(2) required this.description,
      @HiveField(3) this.isCompleted = false,
      @HiveField(4) this.completedBy,
      @HiveField(5) this.completedAt,
      @HiveField(6) final List<String>? photoUrls,
      @HiveField(7) final List<String>? pendingPhotos})
      : _photoUrls = photoUrls,
        _pendingPhotos = pendingPhotos,
        super._();

  factory _$CleaningTaskImpl.fromJson(Map<String, dynamic> json) =>
      _$$CleaningTaskImplFromJson(json);

  @override
  @HiveField(0)
  final String id;
  @override
  @HiveField(1)
  final String title;
  @override
  @HiveField(2)
  final String description;
  @override
  @JsonKey()
  @HiveField(3)
  final bool isCompleted;
  @override
  @HiveField(4)
  final String? completedBy;
  @override
  @HiveField(5)
  final DateTime? completedAt;
  final List<String>? _photoUrls;
  @override
  @HiveField(6)
  List<String>? get photoUrls {
    final value = _photoUrls;
    if (value == null) return null;
    if (_photoUrls is EqualUnmodifiableListView) return _photoUrls;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  final List<String>? _pendingPhotos;
  @override
  @HiveField(7)
  List<String>? get pendingPhotos {
    final value = _pendingPhotos;
    if (value == null) return null;
    if (_pendingPhotos is EqualUnmodifiableListView) return _pendingPhotos;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  /// Create a copy of CleaningTask
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
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

abstract class _CleaningTask extends CleaningTask {
  const factory _CleaningTask(
      {@HiveField(0) required final String id,
      @HiveField(1) required final String title,
      @HiveField(2) required final String description,
      @HiveField(3) final bool isCompleted,
      @HiveField(4) final String? completedBy,
      @HiveField(5) final DateTime? completedAt,
      @HiveField(6) final List<String>? photoUrls,
      @HiveField(7) final List<String>? pendingPhotos}) = _$CleaningTaskImpl;
  const _CleaningTask._() : super._();

  factory _CleaningTask.fromJson(Map<String, dynamic> json) =
      _$CleaningTaskImpl.fromJson;

  @override
  @HiveField(0)
  String get id;
  @override
  @HiveField(1)
  String get title;
  @override
  @HiveField(2)
  String get description;
  @override
  @HiveField(3)
  bool get isCompleted;
  @override
  @HiveField(4)
  String? get completedBy;
  @override
  @HiveField(5)
  DateTime? get completedAt;
  @override
  @HiveField(6)
  List<String>? get photoUrls;
  @override
  @HiveField(7)
  List<String>? get pendingPhotos;

  /// Create a copy of CleaningTask
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$CleaningTaskImplCopyWith<_$CleaningTaskImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
