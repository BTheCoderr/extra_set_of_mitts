import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:equatable/equatable.dart';
import '../../../domain/entities/job.dart';
import '../../../domain/repositories/job_repository.dart';

// Events
abstract class JobEvent extends Equatable {
  const JobEvent();

  @override
  List<Object> get props => [];
}

class LoadJobs extends JobEvent {}

class AddJob extends JobEvent {
  final Job job;

  const AddJob(this.job);

  @override
  List<Object> get props => [job];
}

// States
abstract class JobState extends Equatable {
  const JobState();

  @override
  List<Object> get props => [];
}

class JobInitial extends JobState {}

class JobLoading extends JobState {}

class JobLoaded extends JobState {
  final List<Job> jobs;

  const JobLoaded(this.jobs);

  @override
  List<Object> get props => [jobs];
}

class JobError extends JobState {
  final String message;

  const JobError(this.message);

  @override
  List<Object> get props => [message];
}

// Bloc
class JobBloc extends Bloc<JobEvent, JobState> {
  final JobRepository repository;

  JobBloc({required this.repository}) : super(JobInitial()) {
    on<LoadJobs>((event, emit) async {
      emit(JobLoading());
      try {
        final jobs = await repository.getJobs();
        jobs.fold(
          (failure) => emit(JobError(failure.message)),
          (jobs) => emit(JobLoaded(jobs)),
        );
      } catch (e) {
        emit(JobError(e.toString()));
      }
    });

    on<AddJob>((event, emit) async {
      final currentState = state;
      if (currentState is JobLoaded) {
        try {
          final result = await repository.addJob(event.job);
          result.fold(
            (failure) => emit(JobError(failure.message)),
            (_) => emit(JobLoaded([...currentState.jobs, event.job])),
          );
        } catch (e) {
          emit(JobError(e.toString()));
        }
      }
    });
  }
} 