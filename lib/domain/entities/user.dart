import 'package:equatable/equatable.dart';

class User extends Equatable {
  final String id;
  final String email;
  final String name;
  final String? profilePicUrl;
  final String role;
  final bool isActive;
  final String? address;
  final String? city;
  final String? state;
  final String? zipCode;

  const User({
    required this.id,
    required this.email,
    required this.name,
    this.profilePicUrl,
    required this.role,
    this.isActive = true,
    this.address,
    this.city,
    this.state,
    this.zipCode,
  });

  bool get isContractor => role == 'cleaner';

  @override
  List<Object?> get props => [
    id,
    email,
    name,
    profilePicUrl,
    role,
    isActive,
    address,
    city,
    state,
    zipCode,
  ];
} 