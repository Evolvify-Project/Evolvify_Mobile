import 'package:evolvify/features/community/presentation/manager/fetchPosts_cubit/fetch_posts_cubit.dart';
import 'package:evolvify/features/community/presentation/views/widgets/post_Item.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class PostsList extends StatelessWidget {
  const PostsList({super.key});
  
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<FetchPostsCubit, FetchPostsState>(
      builder: (context, state) {
        if (state is FetchPostsloading) {
          return Center(child: CircularProgressIndicator());
        } else if (state is FetchPostssuccess) {
          final posts = state.posts;
          return ListView.builder(
            shrinkWrap: true,
            physics: AlwaysScrollableScrollPhysics(),
            itemCount: posts.length,
            itemBuilder: (BuildContext context, index) {
              return Padding(
                padding: const EdgeInsets.only(bottom: 20),
                child: PostItem(postModel: posts[index]),
              );
            },
          );
        } else if (state is FetchPostsfailure) {
          return Text(
            '                 No Posts available '
            '\n ${state.errMassage.toString()}',
          );
        }
        return Center(child: Text('No posts available.'));
      },
    );
  }
}
