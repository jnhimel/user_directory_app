// lib/presentation/widgets/user_list_item.dart
import 'package:flutter/material.dart';
import 'package:cached_network_image/cached_network_image.dart';

import '../../domain/entities/user_entity.dart';

class UserListItem extends StatelessWidget {
  final UserEntity user;
  final VoidCallback onTap;

  const UserListItem({super.key, required this.user, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      elevation: 2,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      child: ListTile(
        contentPadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
        leading: Hero(
          tag: 'user_avatar_${user.id}',
          child: CircleAvatar(
            backgroundImage: CachedNetworkImageProvider(user.avatar),
            radius: 24,
          ),
        ),
        title: Text(
          user.fullName,
          style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
        ),
        subtitle: Text(user.email),
        trailing: const Icon(Icons.chevron_right),
        onTap: onTap,
      ),
    );
  }
}
