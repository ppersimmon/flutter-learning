import 'package:flutter/material.dart';
import '../utils/constants.dart';

class ProfileInfo extends StatelessWidget {
  const ProfileInfo({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: Sizes.p20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          gapH8,
          const Text(
            'Admin',
            style: TextStyle(
              fontSize: 24,
              fontWeight: FontWeight.bold,
            ),
          ),
          gapH8,
          const Text(
            '@admin',
            style: TextStyle(fontSize: 16, color: CColors.grey100),
          ),
          gapH40,
          Row(
            children: [
              Icon(Icons.cake, size: Sizes.p16, color: CColors.grey100),
              gapW8,
              const Text(
                'Born 1 January 2000 ',
                style: TextStyle(fontSize: 16, color: CColors.grey100),
              ),
            ],
          ),
          gapH8,
          Row(
            children: [
              Icon(
                Icons.calendar_month,
                size: Sizes.p16,
                color: CColors.grey100,
              ),
              gapW8,
              const Text(
                'Joined January 2021 ',
                style: TextStyle(fontSize: 16, color: CColors.grey100),
              ),
              Icon(
                Icons.arrow_forward_ios,
                size: Sizes.p16,
                color: CColors.grey100,
              ),
            ],
          ),
          gapH12,
          Row(
            children: [
              const Text(
                '66.6K',
                style: TextStyle(
                  fontSize: 16,
                  color: CColors.black,
                  fontWeight: FontWeight.bold,
                ),
              ),
              gapW8,
              const Text(
                'Following',
                style: TextStyle(fontSize: 16, color: CColors.grey100),
              ),
              gapW24,
              const Text(
                '666',
                style: TextStyle(
                  fontSize: 16,
                  color: CColors.black,
                  fontWeight: FontWeight.bold,
                ),
              ),
              gapW8,
              const Text(
                'Followers',
                style: TextStyle(fontSize: 16, color: CColors.grey100),
              ),
            ],
          ),
        ],
      ),
    );
  }
}