import 'package:equatable/equatable.dart';

abstract class Failure extends Equatable {
  final String message;

  const Failure({required this.message});

  @override
  List<Object> get props => [message];
}

class ServerFailure extends Failure {
  const ServerFailure({required String message}) : super(message: message);
}

class CacheFailure extends Failure {
  const CacheFailure({required String message}) : super(message: message);
}

class NetworkFailure extends Failure {
  const NetworkFailure({required String message}) : super(message: message);
}

class ValidationFailure extends Failure {
  const ValidationFailure({required String message}) : super(message: message);
}

class LocationFailure extends Failure {
  const LocationFailure({required String message}) : super(message: message);
}

class AuthenticationFailure extends Failure {
  const AuthenticationFailure({required String message}) : super(message: message);
}

class PermissionFailure extends Failure {
  const PermissionFailure({required String message}) : super(message: message);
}

class BiometricFailure extends Failure {
  const BiometricFailure({required String message}) : super(message: message);
}

class AuthFailure extends Failure {
  const AuthFailure({required String message}) : super(message: message);
} 