import 'package:evolvify/core/utils/app_style.dart';
import 'package:evolvify/core/widgets/showSnackBar.dart';
import 'package:evolvify/features/community/presentation/manager/createPost_cubit/create_post_cubit.dart';
import 'package:evolvify/features/community/presentation/views/widgets/custom_botton_Post.dart';
import 'package:evolvify/features/community/presentation/views/widgets/custom_text_field.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

class CreatePostPage extends StatelessWidget {
  CreatePostPage({super.key});
  final TextEditingController postController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocListener<CreatePostCubit, CreatePostState>(
        listener: (context, state) {
          if (state is CreatePostsuccess) {
            showSnackBar(context, text: 'Post created successfully!');
          } else if (state is CreatePostfailure) {
            showSnackBar(context, text: 'Error: ${state.errMassage}');
          }
        },

        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(height: 30),
              Padding(
                padding: const EdgeInsets.only(left: 20),
                child: GestureDetector(
                  onTap: () {
                    GoRouter.of(context).pop();
                    //  Navigator.pop(context);
                  },
                  child: Text(
                    'Cancel',
                    style: AppStyle.styleSemiBold24.copyWith(fontSize: 14),
                  ),
                ),
              ),
              SizedBox(height: 12),
              CustomTextFormField(
                controller: postController,

                mixLine: 12,
                hint: 'What do you think right now?',
              ),
              SizedBox(height: 18),

              CustomBottonPost(
                onTap: () async {
                  final content = postController.text.trim();
                  if (content.isNotEmpty) {
                    await BlocProvider.of<CreatePostCubit>(
                      context,
                    ).createpost(content);
                    postController.clear();
                  } else {
                    showSnackBar(
                      context,
                      text: 'Post content cannot be empty.',
                    );
                  }
                  Navigator.pop(context);
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
