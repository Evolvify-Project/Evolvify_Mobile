
import 'package:evolvify/features/community/presentation/views/widgets/post_Item.dart';
import 'package:flutter/material.dart';

class PostsList extends StatelessWidget {
  const PostsList({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      shrinkWrap: true,
      physics: AlwaysScrollableScrollPhysics(),
      itemCount: 5,
      itemBuilder: (BuildContext context, index) {
        return Padding(
          padding: const EdgeInsets.only(bottom: 20),
          child: PostItem(),
        );
      },
    );
  }
}
