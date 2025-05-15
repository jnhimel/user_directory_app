import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:user_directory_app/features/users_list/domain/entities/user_entity.dart';

class UserDetailsPage extends StatelessWidget {
  final UserEntity user;
  const UserDetailsPage({super.key, required this.user});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(user.fullName)),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Hero(
                tag: 'user_avatar_${user.id}',
                child: CircleAvatar(
                  radius: 75,
                  backgroundColor: Colors.grey[200],
                  backgroundImage: CachedNetworkImageProvider(user.avatar),
                ),
              ),
              const SizedBox(height: 24),
              Text(
                user.fullName,
                style: const TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 8),
              _buildInfoCard('Email', user.email, Icons.email),
              const SizedBox(height: 12),
              _buildInfoCard('ID', '#${user.id}', Icons.badge),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildInfoCard(String title, String value, IconData icon) {
    return Card(
      elevation: 2,
      margin: const EdgeInsets.symmetric(vertical: 4, horizontal: 0),
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Row(
          children: [
            Icon(icon, color: Colors.blue),
            const SizedBox(width: 16),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: TextStyle(fontSize: 14, color: Colors.grey[600]),
                ),
                const SizedBox(height: 4),
                Text(
                  value,
                  style: const TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
