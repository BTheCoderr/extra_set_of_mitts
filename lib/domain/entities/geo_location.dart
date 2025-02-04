import 'package:hive/hive.dart';

part 'geo_location.g.dart';

@HiveType(typeId: 4)
class GeoLocation {
  @HiveField(0)
  final double latitude;
  
  @HiveField(1)
  final double longitude;

  const GeoLocation({
    required this.latitude,
    required this.longitude,
  });

  factory GeoLocation.fromJson(Map<String, dynamic> json) => GeoLocation(
    latitude: json['latitude'] as double,
    longitude: json['longitude'] as double,
  );

  Map<String, dynamic> toJson() => {
    'latitude': latitude,
    'longitude': longitude,
  };

  @override
  bool operator ==(Object other) =>
    identical(this, other) ||
    other is GeoLocation &&
    runtimeType == other.runtimeType &&
    latitude == other.latitude &&
    longitude == other.longitude;

  @override
  int get hashCode => latitude.hashCode ^ longitude.hashCode;
} 