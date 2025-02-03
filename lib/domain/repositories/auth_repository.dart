import 'package:dartz/dartz.dart';
import 'package:two_local_gals_housekeeping/core/error/failures.dart';

abstract class AuthRepository {
  Future<Either<Failure, String>> login(String username, String password);
  Future<Either<Failure, bool>> checkBiometricAvailability();
  Future<Either<Failure, String>> loginWithBiometrics();
  Future<Either<Failure, bool>> isTokenValid();
  Future<Either<Failure, bool>> isContractorActive();
  Future<Either<Failure, bool>> isLocationEnabled();
  Future<Either<Failure, void>> saveToken(String token);
  Future<Either<Failure, void>> clearToken();
  Future<Either<Failure, bool>> shouldShowWalkthrough();
  Future<Either<Failure, void>> setWalkthroughShown(bool shown);
} 