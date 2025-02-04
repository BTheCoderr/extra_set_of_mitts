import 'package:dartz/dartz.dart';
import '../../core/error/failures.dart';

abstract class AuthRepository {
  Future<Either<Failure, bool>> login(String username, String password);
  Future<Either<Failure, bool>> signUp({
    required String username,
    required String email,
    required String password,
  });
  Future<Either<Failure, bool>> loginWithBiometrics();
  Future<Either<Failure, void>> logout();
  Future<Either<Failure, bool>> isLoggedIn();
  Future<Either<Failure, bool>> isLocationEnabled();
  Future<Either<Failure, void>> saveToken(String token);
  Future<Either<Failure, void>> clearToken();
  Future<Either<Failure, bool>> shouldShowWalkthrough();
  Future<Either<Failure, Unit>> setWalkthroughShown(bool shown);
} 