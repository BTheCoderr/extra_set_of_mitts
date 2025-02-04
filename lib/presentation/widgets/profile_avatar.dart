import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../bloc/auth/auth_bloc.dart';
import 'package:cached_network_image/cached_network_image.dart';

class ProfileAvatar extends StatelessWidget {
  final String? imageUrl;
  final double size;
  final VoidCallback? onTap;

  const ProfileAvatar({
    super.key,
    this.imageUrl,
    this.size = 40,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: CircleAvatar(
        radius: size / 2,
        backgroundColor: Colors.grey[200],
        backgroundImage: imageUrl != null
            ? CachedNetworkImageProvider(imageUrl!)
            : const AssetImage('assets/images/default_avatar.png') as ImageProvider,
      ),
    );
  }
} 