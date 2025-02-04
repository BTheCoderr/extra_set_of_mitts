import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:image_picker/image_picker.dart';
import '../../domain/entities/job.dart';
import '../../domain/entities/task.dart';
import '../../domain/entities/photo.dart';
import '../../../../core/services/hive_service.dart';
import '../../../../core/services/notification_service.dart';

// Events
abstract class JobEvent extends Equatable {
  const JobEvent();

  @override
  List<Object?> get props => [];
}

class LoadJob extends JobEvent {
  final String jobId;

  const LoadJob(this.jobId);

  @override
  List<Object?> get props => [jobId];
}

class StartJob extends JobEvent {
  final String jobId;
  final double latitude;
  final double longitude;

  const StartJob({
    required this.jobId,
    required this.latitude,
    required this.longitude,
  });

  @override
  List<Object?> get props => [jobId, latitude, longitude];
}

class CompleteJob extends JobEvent {
  final String jobId;

  const CompleteJob(this.jobId);

  @override
  List<Object?> get props => [jobId];
}

class UpdateTaskStatus extends JobEvent {
  final String jobId;
  final String taskId;
  final bool completed;

  const UpdateTaskStatus({
    required this.jobId,
    required this.taskId,
    required this.completed,
  });

  @override
  List<Object?> get props => [jobId, taskId, completed];
}

class UploadJobPhotos extends JobEvent {
  final String jobId;
  final List<XFile> photos;
  final bool isBefore;

  const UploadJobPhotos({
    required this.jobId,
    required this.photos,
    this.isBefore = true,
  });

  @override
  List<Object?> get props => [jobId, photos, isBefore];
}

class AddJobNote extends JobEvent {
  final String jobId;
  final String note;

  const AddJobNote({
    required this.jobId,
    required this.note,
  });

  @override
  List<Object?> get props => [jobId, note];
}

class RateJob extends JobEvent {
  final String jobId;
  final int score;
  final String? comment;

  const RateJob({
    required this.jobId,
    required this.score,
    this.comment,
  });

  @override
  List<Object?> get props => [jobId, score, comment];
}

// States
abstract class JobState extends Equatable {
  const JobState();

  @override
  List<Object?> get props => [];
}

class JobInitial extends JobState {}

class JobLoading extends JobState {}

class JobLoaded extends JobState {
  final Job job;

  const JobLoaded(this.job);

  @override
  List<Object?> get props => [job];
}

class JobError extends JobState {
  final String message;

  const JobError(this.message);

  @override
  List<Object?> get props => [message];
}

class GeofenceError extends JobState {}

class PhotoUploadSuccess extends JobState {
  final List<Photo> photos;

  const PhotoUploadSuccess(this.photos);

  @override
  List<Object?> get props => [photos];
}

// BLoC
class JobBloc extends Bloc<JobEvent, JobState> {
  final HiveService _hiveService;
  
  JobBloc({
    required HiveService hiveService,
  }) : _hiveService = hiveService,
       super(JobInitial()) {
    on<LoadJob>(_onLoadJob);
    on<StartJob>(_onStartJob);
    on<CompleteJob>(_onCompleteJob);
    on<UpdateTaskStatus>(_onUpdateTaskStatus);
    on<UploadJobPhotos>(_onUploadJobPhotos);
    on<AddJobNote>(_onAddJobNote);
    on<RateJob>(_onRateJob);
  }

  Future<void> _onLoadJob(
    LoadJob event,
    Emitter<JobState> emit,
  ) async {
    try {
      emit(JobLoading());
      final job = await _hiveService.getJob(event.jobId);
      if (job != null) {
        emit(JobLoaded(job));
      } else {
        emit(const JobError('Job not found'));
      }
    } catch (e) {
      emit(JobError(e.toString()));
    }
  }

  Future<void> _onStartJob(
    StartJob event,
    Emitter<JobState> emit,
  ) async {
    try {
      emit(JobLoading());
      final job = await _hiveService.getJob(event.jobId);
      if (job != null) {
        final updatedJob = job.copyWith(
          status: 'in_progress',
          startTime: DateTime.now(),
        );
        await _hiveService.saveJob(updatedJob);
        await NotificationService.showJobStatusUpdateNotification(
          event.jobId,
          'in progress',
        );
        emit(JobLoaded(updatedJob));
      } else {
        emit(const JobError('Job not found'));
      }
    } catch (e) {
      emit(JobError(e.toString()));
    }
  }

  Future<void> _onCompleteJob(
    CompleteJob event,
    Emitter<JobState> emit,
  ) async {
    try {
      emit(JobLoading());
      final job = await _hiveService.getJob(event.jobId);
      if (job != null) {
        final updatedJob = job.copyWith(
          status: 'completed',
          completedAt: DateTime.now(),
        );
        await _hiveService.saveJob(updatedJob);
        await NotificationService.showJobStatusUpdateNotification(
          event.jobId,
          'completed',
        );
        emit(JobLoaded(updatedJob));
      } else {
        emit(const JobError('Job not found'));
      }
    } catch (e) {
      emit(JobError(e.toString()));
    }
  }

  Future<void> _onUpdateTaskStatus(
    UpdateTaskStatus event,
    Emitter<JobState> emit,
  ) async {
    try {
      emit(JobLoading());
      final job = await _hiveService.getJob(event.jobId);
      if (job != null) {
        final updatedTasks = job.tasks.map((task) {
          if (task.id == event.taskId) {
            final updatedTask = task.copyWith(
              completed: event.completed,
              completedAt: event.completed ? DateTime.now() : null,
            );
            if (event.completed) {
              NotificationService.showTaskCompletionNotification(
                event.jobId,
                task.name,
              );
            }
            return updatedTask;
          }
          return task;
        }).toList();
        
        final updatedJob = job.copyWith(tasks: updatedTasks);
        await _hiveService.saveJob(updatedJob);
        emit(JobLoaded(updatedJob));
      } else {
        emit(const JobError('Job not found'));
      }
    } catch (e) {
      emit(JobError(e.toString()));
    }
  }

  Future<void> _onUploadJobPhotos(
    UploadJobPhotos event,
    Emitter<JobState> emit,
  ) async {
    try {
      emit(JobLoading());
      final job = await _hiveService.getJob(event.jobId);
      if (job != null) {
        // TODO: Implement photo upload to cloud storage
        // For now, just store locally
        final newPhotos = event.photos.map((file) => Photo(
          id: '${event.jobId}_${DateTime.now().millisecondsSinceEpoch}',
          url: file.path,
          type: event.isBefore ? 'before' : 'after',
          timestamp: DateTime.now(),
          uploadedBy: job.assignedTo,
        )).toList();
        
        final updatedPhotos = [...job.photos, ...newPhotos];
        final updatedJob = job.copyWith(photos: updatedPhotos);
        await _hiveService.saveJob(updatedJob);
        emit(PhotoUploadSuccess(newPhotos));
        emit(JobLoaded(updatedJob));
      } else {
        emit(const JobError('Job not found'));
      }
    } catch (e) {
      emit(JobError(e.toString()));
    }
  }

  Future<void> _onAddJobNote(
    AddJobNote event,
    Emitter<JobState> emit,
  ) async {
    try {
      emit(JobLoading());
      final job = await _hiveService.getJob(event.jobId);
      if (job != null) {
        final updatedJob = job.copyWith(
          notes: event.note,
        );
        await _hiveService.saveJob(updatedJob);
        emit(JobLoaded(updatedJob));
      } else {
        emit(const JobError('Job not found'));
      }
    } catch (e) {
      emit(JobError(e.toString()));
    }
  }

  Future<void> _onRateJob(
    RateJob event,
    Emitter<JobState> emit,
  ) async {
    try {
      emit(JobLoading());
      final job = await _hiveService.getJob(event.jobId);
      if (job != null) {
        final rating = Rating(
          score: event.score,
          comment: event.comment,
          timestamp: DateTime.now(),
          ratedBy: job.assignedTo,
        );
        final updatedJob = job.copyWith(rating: rating);
        await _hiveService.saveJob(updatedJob);
        emit(JobLoaded(updatedJob));
      } else {
        emit(const JobError('Job not found'));
      }
    } catch (e) {
      emit(JobError(e.toString()));
    }
  }
} 