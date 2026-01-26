import 'package:flutter/material.dart';

class ProfileInfo extends StatelessWidget {
  const ProfileInfo({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const SizedBox(height: 8),
          const Text(
            'Admin',
            style: TextStyle(
              fontSize: 24,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: 8),
          const Text(
            '@admin',
            style: TextStyle(fontSize: 16, color: Colors.grey),
          ),
          const SizedBox(height: 50),
          Row(
            children: [
              Icon(Icons.cake, size: 16, color: Colors.grey),
              const SizedBox(width: 8),
              const Text(
                'Born 1 January 2000 ',
                style: TextStyle(fontSize: 16, color: Colors.grey),
              ),
            ],
          ),
          const SizedBox(height: 8),
          Row(
            children: [
              Icon(
                Icons.calendar_month,
                size: 16,
                color: Colors.grey,
              ),
              const SizedBox(width: 8),
              const Text(
                'Joined January 2021 ',
                style: TextStyle(fontSize: 16, color: Colors.grey),
              ),
              Icon(
                Icons.arrow_forward_ios,
                size: 16,
                color: Colors.grey,
              ),
            ],
          ),
          const SizedBox(height: 12),
          Row(
            children: [
              const Text(
                '66.6K',
                style: TextStyle(
                  fontSize: 16,
                  color: Colors.black,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(width: 8),
              const Text(
                'Following',
                style: TextStyle(fontSize: 16, color: Colors.grey),
              ),
              const SizedBox(width: 24),
              const Text(
                '666',
                style: TextStyle(
                  fontSize: 16,
                  color: Colors.black,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(width: 8),
              const Text(
                'Followers',
                style: TextStyle(fontSize: 16, color: Colors.grey),
              ),
            ],
          ),
        ],
      ),
    );
  }
}