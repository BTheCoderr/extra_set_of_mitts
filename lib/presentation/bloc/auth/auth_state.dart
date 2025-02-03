part of 'auth_bloc.dart';

@freezed
class AuthState with _$AuthState {
  const factory AuthState.initial() = _Initial;
  
  const factory AuthState.loading() = _Loading;
  
  const factory AuthState.authenticated(
    String token, {
    @Default(true) bool showWalkthrough,
  }) = _Authenticated;
  
  const factory AuthState.unauthenticated() = _Unauthenticated;
  
  const factory AuthState.error(String message) = _Error;
  
  const factory AuthState.locationEnabled() = _LocationEnabled;
  
  const factory AuthState.locationDisabled() = _LocationDisabled;
} 