import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'user_avatar.dart';
import '../utils/constants.dart';

class PostItem extends StatelessWidget {
  final String? image;

  const PostItem({
    super.key,
    this.image,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        color: CColors.grey50,
        border: Border(bottom: BorderSide(color: CColors.grey100, width: 0.2)),
      ),
      padding: const EdgeInsets.all(Sizes.p12),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const UserAvatar(
            radius: Sizes.p24,
          ),

          gapW12,

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
                    gapW4,
                    Text(
                      '@user · 1d',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 16,
                      ),
                    ),
                    const Spacer(),
                    Icon(Icons.more_horiz, size: Sizes.p16, color: CColors.grey600),
                  ],
                ),
                gapH4,
                const Text(
                  'Really funny tweet',
                  style: TextStyle(fontSize: 16, height: 1.3),
                ),
                gapH10,

                Container(
                  height: Sizes.p200,
                  width: double.infinity,
                  clipBehavior: Clip.hardEdge,
                  decoration: BoxDecoration(borderRadius: BorderRadius.circular(12)),
                  child: Hero(
                    tag: image ?? 'assets/images/post_img.jpg',
                    child: Material(
                      color: CColors.transparent,
                      child: InkWell(
                        onTap: () {
                          Navigator.of(context).push(
                            MaterialPageRoute(
                              builder: (context) => Scaffold(
                                backgroundColor: CColors.black,
                                body: Center(
                                  child: Hero(
                                    tag: image ?? 'assets/images/post_img.jpg',
                                    child: Image.asset(
                                      image ?? 'assets/images/post_img.jpg',
                                      fit: BoxFit.cover,
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          );
                        },
                        child: Image.asset(
                          image ?? 'assets/images/post_img.jpg',
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                  ),
                ),

                gapH12,

                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    _buildActionButton(FontAwesomeIcons.comment, '6K'),
                    _buildActionButton(FontAwesomeIcons.retweet, '66'),
                    _buildActionButton(FontAwesomeIcons.heart, '66K', color: CColors.red,),
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
      FaIcon(icon, size: Sizes.p16, color: color ?? CColors.grey100),
      if (label.isNotEmpty) ...[
        gapW4,
        Text(
          label,
          style: TextStyle(fontSize: 12, color: color ?? CColors.grey100),
        ),
      ],
    ],
  );
}
