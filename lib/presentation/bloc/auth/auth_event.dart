part of 'auth_bloc.dart';

@freezed
class AuthEvent with _$AuthEvent {
  const factory AuthEvent.loginWithCredentials({
    required String username,
    required String password,
  }) = _LoginWithCredentials;
  
  const factory AuthEvent.loginWithBiometrics() = _LoginWithBiometrics;
  
  const factory AuthEvent.checkLocationStatus() = _CheckLocationStatus;
  
  const factory AuthEvent.logout() = _Logout;
  
  const factory AuthEvent.setWalkthroughShown() = _SetWalkthroughShown;
} 