import 'package:flutter/material.dart';

import '../mock_data/post.dart';
import '../utils/constants.dart';

class PostMedia extends StatelessWidget {
  final Post post;

  const PostMedia({super.key, required this.post});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: Sizes.p200,
      width: double.infinity,
      clipBehavior: Clip.hardEdge,
      decoration: BoxDecoration(borderRadius: BorderRadius.circular(12)),
      child: Hero(
        tag: post.author.image ?? CImage.defaultPostImage,
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
                        tag: post.author.image ?? CImage.defaultPostImage,
                        child: Image.asset(
                          post.author.image ?? CImage.defaultPostImage,
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                  ),
                ),
              );
            },
            child: Image.asset(
              post.author.image ?? CImage.defaultPostImage,
              fit: BoxFit.cover,
            ),
          ),
        ),
      ),
    );
  }
}
