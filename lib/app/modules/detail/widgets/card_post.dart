import 'package:ceiba/app/models/post.dart';
import 'package:flutter/material.dart';

class PostCard extends StatelessWidget {
  const PostCard({
    Key? key,
    required this.post,
  }) : super(key: key);

  final Post post;

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.only(left: 20, right: 20, bottom: 20),
      child: Container(
        margin: const EdgeInsets.all(15),
        child: Column(
          children: [
            Row(
              children: [
                Expanded(
                  child: Container(
                    margin: const EdgeInsets.only(left: 20),
                    child: Text(
                      post.title!,
                      overflow: TextOverflow.visible,
                      maxLines: 2,
                      style: const TextStyle(
                          color: Colors.black,
                          fontSize: 14,
                          fontWeight: FontWeight.bold),
                    ),
                  ),
                ),
              ],
            ),
            Row(
              children: [
                Expanded(
                  child: Container(
                    margin: const EdgeInsets.only(left: 20),
                    child: Text(
                      post.body!,
                      style: const TextStyle(fontSize: 12),
                    ),
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
