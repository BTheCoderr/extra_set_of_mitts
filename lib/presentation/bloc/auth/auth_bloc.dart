import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../domain/repositories/auth_repository.dart';
import '../../../domain/entities/user.dart';

// Events
abstract class AuthEvent {}

class CheckAuthStatus extends AuthEvent {}

class Login extends AuthEvent {
  final String username;
  final String password;

  Login({required this.username, required this.password});
}

class SignUp extends AuthEvent {
  final String username;
  final String email;
  final String password;

  SignUp({
    required this.username,
    required this.email,
    required this.password,
  });
}

class LoginWithBiometrics extends AuthEvent {}

class Logout extends AuthEvent {}

// States
abstract class AuthState {}

class AuthInitial extends AuthState {}
class AuthLoading extends AuthState {}
class AuthAuthenticated extends AuthState {
  final bool showWalkthrough;
  final User? user;

  AuthAuthenticated({
    this.showWalkthrough = false,
    this.user,
  });
}
class AuthUnauthenticated extends AuthState {}
class AuthError extends AuthState {
  final String message;

  AuthError(this.message);
}

class AuthBloc extends Bloc<AuthEvent, AuthState> {
  final AuthRepository repository;

  AuthBloc({required this.repository}) : super(AuthInitial()) {
    on<CheckAuthStatus>((event, emit) async {
      emit(AuthLoading());
      final result = await repository.isLoggedIn();
      await result.fold(
        (failure) async => emit(AuthUnauthenticated()),
        (isLoggedIn) async {
          if (isLoggedIn) {
            final shouldShowWalkthrough = await repository.shouldShowWalkthrough();
            await shouldShowWalkthrough.fold(
              (failure) async => emit(AuthAuthenticated()),
              (show) async => emit(AuthAuthenticated(showWalkthrough: show)),
            );
          } else {
            emit(AuthUnauthenticated());
          }
        },
      );
    });

    on<Login>((event, emit) async {
      emit(AuthLoading());
      final result = await repository.login(event.username, event.password);
      await result.fold(
        (failure) async => emit(AuthError('Login failed')),
        (success) async {
          if (success) {
            final shouldShowWalkthrough = await repository.shouldShowWalkthrough();
            await shouldShowWalkthrough.fold(
              (failure) async => emit(AuthAuthenticated()),
              (show) async => emit(AuthAuthenticated(showWalkthrough: show)),
            );
          } else {
            emit(AuthError('Login failed'));
          }
        },
      );
    });

    on<SignUp>((event, emit) async {
      emit(AuthLoading());
      final result = await repository.signUp(
        username: event.username,
        email: event.email,
        password: event.password,
      );
      await result.fold(
        (failure) async => emit(AuthError('Sign up failed')),
        (success) async {
          if (success) {
            final shouldShowWalkthrough = await repository.shouldShowWalkthrough();
            await shouldShowWalkthrough.fold(
              (failure) async => emit(AuthAuthenticated()),
              (show) async => emit(AuthAuthenticated(showWalkthrough: show)),
            );
          } else {
            emit(AuthError('Sign up failed'));
          }
        },
      );
    });

    on<LoginWithBiometrics>((event, emit) async {
      emit(AuthLoading());
      final result = await repository.loginWithBiometrics();
      await result.fold(
        (failure) async => emit(AuthError('Biometric authentication failed')),
        (success) async {
          if (success) {
            final shouldShowWalkthrough = await repository.shouldShowWalkthrough();
            await shouldShowWalkthrough.fold(
              (failure) async => emit(AuthAuthenticated()),
              (show) async => emit(AuthAuthenticated(showWalkthrough: show)),
            );
          } else {
            emit(AuthError('Biometric authentication failed'));
          }
        },
      );
    });

    on<Logout>((event, emit) async {
      emit(AuthLoading());
      final result = await repository.logout();
      await result.fold(
        (failure) async => emit(AuthError('Logout failed')),
        (_) async => emit(AuthUnauthenticated()),
      );
    });
  }
} 