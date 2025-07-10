import 'package:device_preview/device_preview.dart';
import 'package:evolvify/core/utils/app_router.dart';
import 'package:evolvify/features/community/presentation/manager/comment/comment_cubit.dart';
import 'package:evolvify/features/community/presentation/manager/createPost_cubit/create_post_cubit.dart';
import 'package:evolvify/features/community/presentation/manager/fetchPosts_cubit/fetch_posts_cubit.dart';
import 'package:evolvify/features/community/presentation/manager/like/like_cubit.dart';
import 'package:evolvify/features/AI-Assessment/presentation/manager/ai_assessment_cubit/ai_assessment_cubit.dart';
import 'package:evolvify/features/AI-Assessment/data/repos/ai_assessment_repository_impl.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() {
  runApp(
    DevicePreview(enabled: true, builder: (context) => const EvolvifyApp()),
  );
}

class EvolvifyApp extends StatelessWidget {
  const EvolvifyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<FetchPostsCubit>(
          create: (_) => FetchPostsCubit()..fetchAllposts(),
        ),
        BlocProvider<CreatePostCubit>(
          create:
              (context) =>
                  CreatePostCubit(BlocProvider.of<FetchPostsCubit>(context)),
        ),
        BlocProvider<LikeCubit>(create: (_) => LikeCubit()),
        BlocProvider<CommentCubit>(create: (_) => CommentCubit()),
        BlocProvider<AiAssessmentCubit>(
          create: (_) => AiAssessmentCubit(AiAssessmentRepositoryImpl()),
        ),
      ],
      child: MaterialApp.router(
        routerConfig: AppRouter.router,

        debugShowCheckedModeBanner: false,
        locale: DevicePreview.locale(context),
        builder: DevicePreview.appBuilder,
        theme: ThemeData(
          scaffoldBackgroundColor: Colors.white,
          fontFamily: 'PlusJakartaSans',
        ),
      ),
    );
  }
}
