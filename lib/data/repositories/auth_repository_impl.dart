import 'dart:convert';
import 'dart:html' if (dart.library.html) 'dart:html' as html;
import 'package:flutter/foundation.dart' show kIsWeb;
import 'package:dartz/dartz.dart';
import 'package:hive/hive.dart';
import 'package:http/http.dart' as http;
import 'package:local_auth/local_auth.dart';
import 'package:extra_set_of_mitts/core/error/failures.dart';
import 'package:extra_set_of_mitts/core/network/network_info.dart';
import 'package:extra_set_of_mitts/domain/repositories/auth_repository.dart';
import 'package:geolocator/geolocator.dart';

class AuthRepositoryImpl implements AuthRepository {
  final http.Client client;
  final NetworkInfo networkInfo;
  final Box<dynamic> authBox;
  final LocalAuthentication localAuth;
  final String baseUrl;

  AuthRepositoryImpl({
    required this.client,
    required this.networkInfo,
    required this.authBox,
    required this.localAuth,
    required this.baseUrl,
  });

  // Helper methods for web storage
  void _setWebStorage(String key, String value) {
    if (kIsWeb) {
      html.window.localStorage[key] = value;
    }
  }

  String? _getWebStorage(String key) {
    if (kIsWeb) {
      return html.window.localStorage[key];
    }
    return null;
  }

  void _removeWebStorage(String key) {
    if (kIsWeb) {
      html.window.localStorage.remove(key);
    }
  }

  @override
  Future<Either<Failure, bool>> login(String username, String password) async {
    final result = await _login(username, password);
    return result.fold(
      (failure) => Left(failure),
      (token) async {
        await saveToken(token);
        return const Right(true);
      },
    );
  }

  @override
  Future<Either<Failure, bool>> checkBiometricAvailability() async {
    try {
      final canAuthenticateWithBiometrics = await localAuth.canCheckBiometrics;
      final canAuthenticate = canAuthenticateWithBiometrics || await localAuth.isDeviceSupported();
      return Right(canAuthenticate);
    } catch (e) {
      return Left(BiometricFailure(message: 'Biometric authentication failed'));
    }
  }

  @override
  Future<Either<Failure, bool>> loginWithBiometrics() async {
    try {
      final didAuthenticate = await localAuth.authenticate(
        localizedReason: 'Please authenticate to login',
        options: const AuthenticationOptions(
          stickyAuth: true,
          biometricOnly: true,
        ),
      );

      if (didAuthenticate) {
        final savedToken = kIsWeb 
            ? _getWebStorage('token')
            : authBox.get('token');
        if (savedToken != null) {
          return const Right(true);
        }
      }
      return const Right(false);
    } catch (e) {
      return Left(BiometricFailure(message: 'Biometric authentication failed'));
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
        return Left(ServerFailure(message: 'Server error occurred'));
      }
    } else {
      return Left(NetworkFailure(message: 'No internet connection'));
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
          return Left(ServerFailure(message: 'Server error occurred'));
        }
      } catch (e) {
        return Left(ServerFailure(message: 'Server error occurred'));
      }
    } else {
      return Left(NetworkFailure(message: 'No internet connection'));
    }
  }

  @override
  Future<Either<Failure, bool>> isLocationEnabled() async {
    if (kIsWeb) {
      try {
        // For web, we'll use the Geolocation API
        final position = await html.window.navigator.geolocation.getCurrentPosition();
        return const Right(true);
      } catch (e) {
        return const Right(false);
      }
    } else {
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
        return Left(LocationFailure(message: 'Failed to get location'));
      }
    }
  }

  @override
  Future<Either<Failure, void>> saveToken(String token) async {
    try {
      if (kIsWeb) {
        _setWebStorage('token', token);
      } else {
        await authBox.put('token', token);
      }
      return const Right(null);
    } catch (e) {
      return Left(CacheFailure(message: 'Failed to save data to cache'));
    }
  }

  @override
  Future<Either<Failure, void>> clearToken() async {
    try {
      if (kIsWeb) {
        _removeWebStorage('token');
      } else {
        await authBox.delete('token');
      }
      return const Right(null);
    } catch (e) {
      return Left(CacheFailure(message: 'Failed to save data to cache'));
    }
  }

  @override
  Future<Either<Failure, bool>> shouldShowWalkthrough() async {
    try {
      final hasShownWalkthrough = kIsWeb 
          ? _getWebStorage('walkthrough_shown') == 'true'
          : (authBox.get('walkthrough_shown') as bool?) ?? false;
      return Right(!hasShownWalkthrough);
    } catch (e) {
      return Left(CacheFailure(message: 'Failed to get walkthrough status'));
    }
  }

  @override
  Future<Either<Failure, Unit>> setWalkthroughShown(bool shown) async {
    try {
      if (kIsWeb) {
        _setWebStorage('walkthrough_shown', shown.toString());
      } else {
        await authBox.put('walkthrough_shown', shown.toString());
      }
      return const Right(unit);
    } catch (e) {
      return Left(CacheFailure(message: 'Failed to set walkthrough status'));
    }
  }

  @override
  Future<Either<Failure, void>> logout() async {
    try {
      await clearToken();
      return const Right(null);
    } catch (e) {
      return Left(AuthFailure(message: 'Authentication failed'));
    }
  }

  @override
  Future<Either<Failure, bool>> isLoggedIn() async {
    try {
      final token = kIsWeb 
          ? _getWebStorage('token')
          : authBox.get('token');
      return Right(token != null);
    } catch (e) {
      return Left(AuthFailure(message: 'Authentication failed'));
    }
  }

  @override
  Future<Either<Failure, bool>> signUp({
    required String username,
    required String email,
    required String password,
  }) async {
    if (await networkInfo.isConnected) {
      try {
        final requestBody = {
          'name': username,
          'email': email,
          'password': password,
          'address': ''
        };
        print('Sending signup request to: ${Uri.parse('$baseUrl/auth/signup')}');
        print('Request body: $requestBody');
        
        final response = await client.post(
          Uri.parse('$baseUrl/auth/signup'),
          headers: {
            'Content-Type': 'application/json',
          },
          body: json.encode(requestBody),
        );

        print('Response status: ${response.statusCode}');
        print('Response body: ${response.body}');

        if (response.statusCode == 201) {
          final data = json.decode(response.body);
          final token = data['token'];
          if (token != null) {
            await saveToken(token);
            return const Right(true);
          }
          return Left(AuthFailure(message: 'Invalid response from server'));
        } else if (response.statusCode == 409) {
          return Left(AuthFailure(message: 'Username or email already exists'));
        } else if (response.statusCode == 400) {
          final data = json.decode(response.body);
          return Left(AuthFailure(message: data['message'] ?? 'Invalid input data'));
        } else {
          return Left(ServerFailure(message: 'Server error: ${response.statusCode}'));
        }
      } catch (e) {
        if (e.toString().contains('Connection refused')) {
          return Left(NetworkFailure(message: 'Could not connect to server. Please make sure the server is running.'));
        }
        return Left(ServerFailure(message: 'Server error: ${e.toString()}'));
      }
    } else {
      return Left(NetworkFailure(message: 'No internet connection. Please check your network settings.'));
    }
  }

  // Helper method for actual login
  Future<Either<Failure, String>> _login(String username, String password) async {
    if (await networkInfo.isConnected) {
      try {
        // Make sure username includes @gmail.com if it's not already an email
        final email = username.contains('@') ? username : '$username@gmail.com';
        
        final requestBody = {
          'email': email,
          'password': password,
        };
        print('Sending login request to: ${Uri.parse('$baseUrl/auth/signin')}');
        print('Request body: $requestBody');

        final response = await client.post(
          Uri.parse('$baseUrl/auth/signin'),
          headers: {'Content-Type': 'application/json'},
          body: json.encode(requestBody),
        );

        print('Response status: ${response.statusCode}');
        print('Response body: ${response.body}');

        if (response.statusCode == 200) {
          final data = json.decode(response.body);
          return Right(data['token']);
        } else if (response.statusCode == 401) {
          return Left(AuthFailure(message: 'Invalid email or password'));
        } else {
          return Left(ServerFailure(message: 'Server error: ${response.statusCode}'));
        }
      } catch (e) {
        if (e.toString().contains('Connection refused')) {
          return Left(NetworkFailure(message: 'Could not connect to server. Please make sure the server is running.'));
        }
        return Left(ServerFailure(message: 'Server error: ${e.toString()}'));
      }
    } else {
      return Left(NetworkFailure(message: 'No internet connection'));
    }
  }
} 