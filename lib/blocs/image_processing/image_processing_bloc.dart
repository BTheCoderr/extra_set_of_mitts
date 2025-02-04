import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:image_picker/image_picker.dart';
import '../../repositories/image_repository.dart';

// Events
abstract class ImageProcessingEvent extends Equatable {
  const ImageProcessingEvent();

  @override
  List<Object?> get props => [];
}

class PickImageEvent extends ImageProcessingEvent {
  final bool fromCamera;

  const PickImageEvent({required this.fromCamera});

  @override
  List<Object?> get props => [fromCamera];
}

class UploadJobPhotoEvent extends ImageProcessingEvent {
  final XFile image;
  final String jobId;
  final bool isBefore;

  const UploadJobPhotoEvent({
    required this.image,
    required this.jobId,
    required this.isBefore,
  });

  @override
  List<Object?> get props => [image, jobId, isBefore];
}

class UploadProfilePhotoEvent extends ImageProcessingEvent {
  final XFile image;

  const UploadProfilePhotoEvent({required this.image});

  @override
  List<Object?> get props => [image];
}

class LoadJobPhotosEvent extends ImageProcessingEvent {
  final String jobId;

  const LoadJobPhotosEvent({required this.jobId});

  @override
  List<Object?> get props => [jobId];
}

class DeletePhotoEvent extends ImageProcessingEvent {
  final String photoId;
  final String jobId;

  const DeletePhotoEvent({
    required this.photoId,
    required this.jobId,
  });

  @override
  List<Object?> get props => [photoId, jobId];
}

// States
abstract class ImageProcessingState extends Equatable {
  const ImageProcessingState();

  @override
  List<Object?> get props => [];
}

class ImageProcessingInitial extends ImageProcessingState {}

class ImageProcessingLoading extends ImageProcessingState {}

class ImagePickedSuccess extends ImageProcessingState {
  final XFile image;

  const ImagePickedSuccess(this.image);

  @override
  List<Object?> get props => [image];
}

class JobPhotoUploadSuccess extends ImageProcessingState {
  final Map<String, dynamic> photoData;

  const JobPhotoUploadSuccess(this.photoData);

  @override
  List<Object?> get props => [photoData];
}

class ProfilePhotoUploadSuccess extends ImageProcessingState {
  final Map<String, dynamic> photoData;

  const ProfilePhotoUploadSuccess(this.photoData);

  @override
  List<Object?> get props => [photoData];
}

class JobPhotosLoadSuccess extends ImageProcessingState {
  final List<Map<String, dynamic>> photos;

  const JobPhotosLoadSuccess(this.photos);

  @override
  List<Object?> get props => [photos];
}

class PhotoDeleteSuccess extends ImageProcessingState {}

class ImageProcessingError extends ImageProcessingState {
  final String message;

  const ImageProcessingError(this.message);

  @override
  List<Object?> get props => [message];
}

// BLoC
class ImageProcessingBloc extends Bloc<ImageProcessingEvent, ImageProcessingState> {
  final ImageRepository _imageRepository;

  ImageProcessingBloc({
    required ImageRepository imageRepository,
  })  : _imageRepository = imageRepository,
        super(ImageProcessingInitial()) {
    on<PickImageEvent>(_onPickImage);
    on<UploadJobPhotoEvent>(_onUploadJobPhoto);
    on<UploadProfilePhotoEvent>(_onUploadProfilePhoto);
    on<LoadJobPhotosEvent>(_onLoadJobPhotos);
    on<DeletePhotoEvent>(_onDeletePhoto);
  }

  Future<void> _onPickImage(
    PickImageEvent event,
    Emitter<ImageProcessingState> emit,
  ) async {
    try {
      emit(ImageProcessingLoading());
      final image = await _imageRepository.pickImage(fromCamera: event.fromCamera);
      if (image != null) {
        emit(ImagePickedSuccess(image));
      } else {
        emit(const ImageProcessingError('No image selected'));
      }
    } catch (e) {
      emit(ImageProcessingError(e.toString()));
    }
  }

  Future<void> _onUploadJobPhoto(
    UploadJobPhotoEvent event,
    Emitter<ImageProcessingState> emit,
  ) async {
    try {
      emit(ImageProcessingLoading());
      final result = await _imageRepository.uploadImage(
        event.image,
        jobId: event.jobId,
        isBefore: event.isBefore,
      );
      emit(JobPhotoUploadSuccess(result));
    } catch (e) {
      emit(ImageProcessingError(e.toString()));
    }
  }

  Future<void> _onUploadProfilePhoto(
    UploadProfilePhotoEvent event,
    Emitter<ImageProcessingState> emit,
  ) async {
    try {
      emit(ImageProcessingLoading());
      final result = await _imageRepository.uploadProfilePhoto(event.image);
      emit(ProfilePhotoUploadSuccess(result));
    } catch (e) {
      emit(ImageProcessingError(e.toString()));
    }
  }

  Future<void> _onLoadJobPhotos(
    LoadJobPhotosEvent event,
    Emitter<ImageProcessingState> emit,
  ) async {
    try {
      emit(ImageProcessingLoading());
      final photos = await _imageRepository.getJobPhotos(event.jobId);
      emit(JobPhotosLoadSuccess(photos));
    } catch (e) {
      emit(ImageProcessingError(e.toString()));
    }
  }

  Future<void> _onDeletePhoto(
    DeletePhotoEvent event,
    Emitter<ImageProcessingState> emit,
  ) async {
    try {
      emit(ImageProcessingLoading());
      await _imageRepository.deletePhoto(event.photoId, event.jobId);
      emit(PhotoDeleteSuccess());
      // Reload photos after deletion
      final photos = await _imageRepository.getJobPhotos(event.jobId);
      emit(JobPhotosLoadSuccess(photos));
    } catch (e) {
      emit(ImageProcessingError(e.toString()));
    }
  }
} 