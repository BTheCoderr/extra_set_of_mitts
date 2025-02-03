import 'dart:convert';
import 'package:dartz/dartz.dart';
import 'package:hive/hive.dart';
import 'package:http/http.dart' as http;
import 'package:local_auth/local_auth.dart';
import 'package:two_local_gals_housekeeping/core/error/failures.dart';
import 'package:two_local_gals_housekeeping/core/network/network_info.dart';
import 'package:two_local_gals_housekeeping/domain/repositories/auth_repository.dart';
import 'package:geolocator/geolocator.dart';

class AuthRepositoryImpl implements AuthRepository {
  final http.Client client;
  final NetworkInfo networkInfo;
  final Box<String> authBox;
  final LocalAuthentication localAuth;
  static const String baseUrl = 'http://localhost:5001/api/v1';

  AuthRepositoryImpl({
    required this.client,
    required this.networkInfo,
    required this.authBox,
    required this.localAuth,
  });

  @override
  Future<Either<Failure, String>> login(String username, String password) async {
    if (await networkInfo.isConnected) {
      try {
        final response = await client.post(
          Uri.parse('$baseUrl/user/login'),
          body: json.encode({
            'username': username,
            'password': password,
          }),
          headers: {'Content-Type': 'application/json'},
        );

        if (response.statusCode == 200) {
          final data = json.decode(response.body);
          return Right(data['token']);
        } else {
          return Left(ServerFailure());
        }
      } catch (e) {
        return Left(ServerFailure());
      }
    } else {
      return Left(NetworkFailure());
    }
  }

  @override
  Future<Either<Failure, bool>> checkBiometricAvailability() async {
    try {
      final canAuthenticateWithBiometrics = await localAuth.canCheckBiometrics;
      final canAuthenticate = canAuthenticateWithBiometrics || await localAuth.isDeviceSupported();
      return Right(canAuthenticate);
    } catch (e) {
      return Left(BiometricFailure());
    }
  }

  @override
  Future<Either<Failure, String>> loginWithBiometrics() async {
    try {
      final didAuthenticate = await localAuth.authenticate(
        localizedReason: 'Please authenticate to login',
        options: const AuthenticationOptions(
          stickyAuth: true,
          biometricOnly: true,
        ),
      );

      if (didAuthenticate) {
        final savedToken = authBox.get('token');
        if (savedToken != null) {
          return Right(savedToken);
        }
      }
      return Left(BiometricFailure());
    } catch (e) {
      return Left(BiometricFailure());
    }
  }

  @override
  Future<Either<Failure, bool>> isTokenValid() async {
    final token = authBox.get('token');
    if (token == null) return const Right(false);

    if (await networkInfo.isConnected) {
      try {
        final response = await client.get(
          Uri.parse('$baseUrl/user/validate'),
          headers: {
            'Authorization': 'Bearer $token',
            'Content-Type': 'application/json',
          },
        );

        return Right(response.statusCode == 200);
      } catch (e) {
        return Left(ServerFailure());
      }
    } else {
      return Left(NetworkFailure());
    }
  }

  @override
  Future<Either<Failure, bool>> isContractorActive() async {
    final token = authBox.get('token');
    if (token == null) return const Right(false);

    if (await networkInfo.isConnected) {
      try {
        final response = await client.get(
          Uri.parse('$baseUrl/user/status'),
          headers: {
            'Authorization': 'Bearer $token',
            'Content-Type': 'application/json',
          },
        );

        if (response.statusCode == 200) {
          final data = json.decode(response.body);
          return Right(data['isActive'] ?? false);
        } else {
          return Left(ServerFailure());
        }
      } catch (e) {
        return Left(ServerFailure());
      }
    } else {
      return Left(NetworkFailure());
    }
  }

  @override
  Future<Either<Failure, bool>> isLocationEnabled() async {
    try {
      final serviceEnabled = await Geolocator.isLocationServiceEnabled();
      if (!serviceEnabled) {
        return const Right(false);
      }

      var permission = await Geolocator.checkPermission();
      if (permission == LocationPermission.denied) {
        permission = await Geolocator.requestPermission();
        if (permission == LocationPermission.denied) {
          return const Right(false);
        }
      }

      if (permission == LocationPermission.deniedForever) {
        return const Right(false);
      }

      return const Right(true);
    } catch (e) {
      return Left(LocationFailure());
    }
  }

  @override
  Future<Either<Failure, void>> saveToken(String token) async {
    try {
      await authBox.put('token', token);
      return const Right(null);
    } catch (e) {
      return Left(CacheFailure());
    }
  }

  @override
  Future<Either<Failure, void>> clearToken() async {
    try {
      await authBox.delete('token');
      return const Right(null);
    } catch (e) {
      return Left(CacheFailure());
    }
  }

  @override
  Future<Either<Failure, bool>> shouldShowWalkthrough() async {
    try {
      final hasShownWalkthrough = authBox.get('walkthrough_shown') ?? false;
      return Right(!hasShownWalkthrough);
    } catch (e) {
      return Left(CacheFailure());
    }
  }

  @override
  Future<Either<Failure, void>> setWalkthroughShown(bool shown) async {
    try {
      await authBox.put('walkthrough_shown', shown);
      return const Right(null);
    } catch (e) {
      return Left(CacheFailure());
    }
  }
} 