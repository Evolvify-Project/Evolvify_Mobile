import 'package:evolvify/features/community/data/models/comment_model.dart';
import 'package:evolvify/features/community/presentation/manager/comment/comment_cubit.dart';
import 'package:evolvify/features/community/presentation/manager/fetchAllcomments/fetch_allcomments_cubit.dart';
import 'package:evolvify/features/community/presentation/views/widgets/comment_section.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CommentsList extends StatelessWidget {
  const CommentsList({super.key});

  final bool isShowTextField = false;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<FetchAllcommentsCubit, FetchAllcommentsState>(
      builder: (context, state) {
        if (state is FetchAllcommentsLoading) {
          return Center(child: CircularProgressIndicator());
        } else if (state is FetchAllcommentsSuccess) {
          final List<CommentModel2> comments = state.allComments;
          return SingleChildScrollView(
            child: ListView.builder(
              itemCount: comments.length,
              shrinkWrap: true,
              itemBuilder: (context, index) {
                return CommentSection(
                  onTapReply: () {},
                  commentModel: comments[index],
                );
              },
            ),
          );
        } else if (state is FetchAllcommentsFailure) {
          return Center(child: Text(state.errMessage));
        }
        return Center(child: Text('No Comments yet.'));
      },
    );
  }
}
