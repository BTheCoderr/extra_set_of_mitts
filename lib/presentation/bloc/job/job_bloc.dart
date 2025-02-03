import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import '../../../domain/repositories/job_repository.dart';
import '../../../data/models/job.dart';

part 'job_event.dart';
part 'job_state.dart';
part 'job_bloc.freezed.dart';

class JobBloc extends Bloc<JobEvent, JobState> {
  final JobRepository repository;

  JobBloc({required this.repository}) : super(const JobState.initial()) {
    on<JobEvent>((event, emit) async {
      await event.map(
        loadJobs: (e) => _onLoadJobs(e, emit),
        startJob: (e) => _onStartJob(e, emit),
        completeTask: (e) => _onCompleteTask(e, emit),
        uploadPhotos: (e) => _onUploadPhotos(e, emit),
        checkGeofence: (e) => _onCheckGeofence(e, emit),
      );
    });
  }

  Future<void> _onLoadJobs(_LoadJobs event, Emitter<JobState> emit) async {
    emit(const JobState.loading());

    final result = await repository.getJobs(event.contractorId);
    
    result.fold(
      (failure) => emit(JobState.error(failure.toString())),
      (jobs) => emit(JobState.loaded(jobs))
    );
  }

  Future<void> _onStartJob(_StartJob event, Emitter<JobState> emit) async {
    emit(const JobState.loading());

    final geofenceResult = await repository.isWithinGeofence(
      event.jobId,
      event.location
    );

    await geofenceResult.fold(
      (failure) async => emit(JobState.error(failure.toString())),
      (isWithinGeofence) async {
        if (!isWithinGeofence) {
          emit(const JobState.geofenceError());
          return;
        }

        final result = await repository.startJob(
          event.jobId,
          DateTime.now()
        );

        result.fold(
          (failure) => emit(JobState.error(failure.toString())),
          (job) => emit(JobState.jobStarted(job))
        );
      }
    );
  }

  Future<void> _onCompleteTask(
    _CompleteTask event,
    Emitter<JobState> emit
  ) async {
    emit(const JobState.loading());

    final result = await repository.updateTaskStatus(
      event.jobId,
      event.taskId,
      true,
      event.completedBy
    );

    result.fold(
      (failure) => emit(JobState.error(failure.toString())),
      (job) => emit(JobState.taskCompleted(job))
    );
  }

  Future<void> _onUploadPhotos(
    _UploadPhotos event,
    Emitter<JobState> emit
  ) async {
    emit(const JobState.loading());

    final result = await repository.uploadTaskPhotos(
      event.jobId,
      event.taskId,
      event.photoPaths
    );

    result.fold(
      (failure) => emit(JobState.error(failure.toString())),
      (urls) => emit(JobState.photosUploaded(urls))
    );
  }

  Future<void> _onCheckGeofence(
    _CheckGeofence event,
    Emitter<JobState> emit
  ) async {
    emit(const JobState.loading());

    final result = await repository.isWithinGeofence(
      event.jobId,
      event.location
    );

    result.fold(
      (failure) => emit(JobState.error(failure.toString())),
      (isWithinGeofence) => emit(JobState.geofenceChecked(isWithinGeofence))
    );
  }
} 