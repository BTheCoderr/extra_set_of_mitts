import 'package:geolocator/geolocator.dart';
import 'package:url_launcher/url_launcher.dart';

class LocationService {
  static Future<Position?> getCurrentLocation() async {
    try {
      final permission = await Geolocator.checkPermission();
      if (permission == LocationPermission.denied) {
        final requested = await Geolocator.requestPermission();
        if (requested == LocationPermission.denied) {
          return null;
        }
      }

      if (permission == LocationPermission.deniedForever) {
        return null;
      }

      return await Geolocator.getCurrentPosition(
        desiredAccuracy: LocationAccuracy.high,
      );
    } catch (e) {
      return null;
    }
  }

  static Future<bool> isWithinRange(
    double targetLat,
    double targetLng,
    double maxDistanceInMeters,
  ) async {
    try {
      final currentLocation = await getCurrentLocation();
      if (currentLocation == null) return false;

      final distance = Geolocator.distanceBetween(
        currentLocation.latitude,
        currentLocation.longitude,
        targetLat,
        targetLng,
      );

      return distance <= maxDistanceInMeters;
    } catch (e) {
      return false;
    }
  }

  static Future<void> openInMaps(double latitude, double longitude) async {
    final url = Uri.parse(
      'https://www.google.com/maps/search/?api=1&query=$latitude,$longitude',
    );
    
    if (await canLaunchUrl(url)) {
      await launchUrl(url);
    }
  }

  static String getDistanceString(double meters) {
    if (meters < 1000) {
      return '${meters.round()} m';
    } else {
      final km = meters / 1000;
      return '${km.toStringAsFixed(1)} km';
    }
  }

  static Future<void> startLocationTracking(
    Function(Position) onLocationUpdate,
  ) async {
    final permission = await Geolocator.checkPermission();
    if (permission == LocationPermission.denied) {
      final requested = await Geolocator.requestPermission();
      if (requested == LocationPermission.denied) {
        return;
      }
    }

    if (permission == LocationPermission.deniedForever) {
      return;
    }

    Geolocator.getPositionStream(
      locationSettings: const LocationSettings(
        accuracy: LocationAccuracy.high,
        distanceFilter: 10, // minimum distance (meters) before updates
      ),
    ).listen(onLocationUpdate);
  }
} 