import 'package:internet_connection_checker/internet_connection_checker.dart';
import 'package:flutter/foundation.dart' show kIsWeb;

abstract class NetworkInfo {
  Future<bool> get isConnected;
}

class NetworkInfoImpl implements NetworkInfo {
  final InternetConnectionChecker? connectionChecker;

  NetworkInfoImpl({this.connectionChecker});

  @override
  Future<bool> get isConnected {
    if (kIsWeb) {
      // For web, we'll use navigator.onLine
      return Future.value(true); // Always return true for web for now
    }
    return connectionChecker!.hasConnection;
  }
} 