import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:two_local_gals_housekeeping/domain/repositories/auth_repository.dart';

part 'auth_event.dart';
part 'auth_state.dart';
part 'auth_bloc.freezed.dart';

class AuthBloc extends Bloc<AuthEvent, AuthState> {
  final AuthRepository repository;

  AuthBloc({required this.repository}) : super(const AuthState.initial()) {
    on<AuthEvent>((event, emit) async {
      await event.map(
        loginWithCredentials: (e) async {
          emit(const AuthState.loading());
          
          final isTokenValid = await repository.isTokenValid();
          if (isTokenValid.isRight()) {
            final isActive = await repository.isContractorActive();
            
            if (isActive.isRight()) {
              final result = await repository.login(e.username, e.password);
              
              result.fold(
                (failure) => emit(const AuthState.error('Incorrect Username or Password')),
                (token) async {
                  await repository.saveToken(token);
                  final shouldShowWalkthrough = await repository.shouldShowWalkthrough();
                  shouldShowWalkthrough.fold(
                    (failure) => emit(AuthState.authenticated(token, showWalkthrough: true)),
                    (show) => emit(AuthState.authenticated(token, showWalkthrough: show)),
                  );
                },
              );
            } else {
              emit(const AuthState.error('Invalid login attempt. Please contact the main office'));
            }
          } else {
            emit(const AuthState.error('Session expired. Please login again'));
          }
        },
        loginWithBiometrics: (e) async {
          emit(const AuthState.loading());
          
          final biometricsAvailable = await repository.checkBiometricAvailability();
          
          if (biometricsAvailable.isRight()) {
            final result = await repository.loginWithBiometrics();
            
            result.fold(
              (failure) => emit(const AuthState.error('Biometric authentication failed')),
              (token) async {
                await repository.saveToken(token);
                final shouldShowWalkthrough = await repository.shouldShowWalkthrough();
                shouldShowWalkthrough.fold(
                  (failure) => emit(AuthState.authenticated(token, showWalkthrough: true)),
                  (show) => emit(AuthState.authenticated(token, showWalkthrough: show)),
                );
              },
            );
          } else {
            emit(const AuthState.error('Biometric authentication not available'));
          }
        },
        checkLocationStatus: (e) async {
          final result = await repository.isLocationEnabled();
          result.fold(
            (failure) => emit(const AuthState.locationDisabled()),
            (enabled) => emit(enabled ? const AuthState.locationEnabled() : const AuthState.locationDisabled()),
          );
        },
        logout: (e) async {
          await repository.clearToken();
          emit(const AuthState.unauthenticated());
        },
        setWalkthroughShown: (e) async {
          await repository.setWalkthroughShown(true);
        },
      );
    });
  }
} 