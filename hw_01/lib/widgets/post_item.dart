import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'user_avatar.dart';

class PostItem extends StatelessWidget {
  const PostItem({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        border: Border(bottom: BorderSide(color: Colors.grey, width: 0.2)),
      ),
      padding: const EdgeInsets.all(12),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const UserAvatar(
            radius: 24,
          ),

          const SizedBox(width: 12),

          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    const Text(
                      'User',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 16,
                      ),
                    ),
                    const SizedBox(width: 4),
                    Text(
                      '@user · 1d',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 16,
                      ),
                    ),
                    const Spacer(),
                    Icon(Icons.more_horiz, size: 18, color: Colors.grey[600]),
                  ],
                ),
                const SizedBox(height: 4),
                const Text(
                  'Really funny tweet',
                  style: TextStyle(fontSize: 16, height: 1.3),
                ),
                const SizedBox(height: 10),

                Container(
                  height: 200,
                  width: double.infinity,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(12),
                    color: Colors.black,
                    image: const DecorationImage(
                      image: AssetImage('assets/images/post_img.jpg'),
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
                const SizedBox(height: 12),

                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    _buildActionButton(FontAwesomeIcons.comment, '6K'),
                    _buildActionButton(FontAwesomeIcons.retweet, '66'),
                    _buildActionButton(FontAwesomeIcons.heart, '66K', color: Colors.red,),
                    _buildActionButton(FontAwesomeIcons.chartSimple, '666K'),
                    _buildActionButton(FontAwesomeIcons.bookmark, ''),
                    _buildActionButton(FontAwesomeIcons.shareNodes, ''),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

Widget _buildActionButton(IconData icon, String label, {Color? color}) {
  return Row(
    children: [
      FaIcon(icon, size: 16, color: color ?? Colors.grey),
      if (label.isNotEmpty) ...[
        const SizedBox(width: 4),
        Text(
          label,
          style: TextStyle(fontSize: 12, color: color ?? Colors.grey),
        ),
      ],
    ],
  );
}
