import 'package:evolvify/core/widgets/bottom_nav_bar.dart';
import 'package:evolvify/features/Assessment/presentation/views/Recommended_Content_view.dart';
import 'package:evolvify/features/Assessment/presentation/views/assessment_view.dart';
import 'package:evolvify/features/Assessment/presentation/views/test_result_view.dart';
import 'package:evolvify/features/Assessment/presentation/views/test_view.dart';
import 'package:evolvify/features/Courses/presentation/views/course_overview.dart';
import 'package:evolvify/features/auth/presentation/manager/Verify_cubit/cubit/verify_pass_cubit.dart';
import 'package:evolvify/features/auth/presentation/manager/forget_cubit/cubit/forget_pass_cubit.dart';
import 'package:evolvify/features/auth/presentation/manager/login_cubit/cubit/login_cubit.dart';
import 'package:evolvify/features/auth/presentation/manager/register_cubit/cubit/register_cubit.dart';
import 'package:evolvify/features/auth/presentation/manager/reset_cubit/cubit/reset_cubit.dart';
import 'package:evolvify/features/auth/presentation/views/Password_Reset_view.dart';
import 'package:evolvify/features/auth/presentation/views/Set_new_password.dart';
import 'package:evolvify/features/auth/presentation/views/forget_password_view.dart';
import 'package:evolvify/features/auth/presentation/views/login_view.dart';
import 'package:evolvify/features/auth/presentation/views/register_view.dart';
import 'package:evolvify/features/auth/presentation/views/verify_password_view.dart';
import 'package:evolvify/features/chatbot%20_ai/presentation/views/chatbot_page.dart';
import 'package:evolvify/features/community/presentation/views/comments_view.dart';
import 'package:evolvify/features/community/presentation/views/community_page.dart';
import 'package:evolvify/features/community/presentation/views/create_post.dart';
import 'package:evolvify/features/community/presentation/views/widgets/create_post_providers.dart';
import 'package:evolvify/features/home/presentation/views/home_view.dart';
import 'package:evolvify/features/on_Boarding/on_Boarding_pageview.dart';
import 'package:evolvify/features/on_Boarding/presentation/views/logo_view.dart';
import 'package:evolvify/features/on_Boarding/presentation/views/widgets/on_boarding_view.dart';
import 'package:evolvify/features/search/presentation/views/search_view.dart';
import 'package:evolvify/features/splash%20screen/splash_screen_one.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

abstract class AppRouter {
  static const klogoView = '/logoView';
  static const kTestView = '/TestView';
  static const kAssessmentView = '/assessmentView';
  static const kTestResultView = '/TestResultView';
  static const kloginView = '/loginView';
  static const kPasswordResetView = '/PasswordResetView';
  static const kSetNewPassword = '/SetNewPassword';
  static const kHomeView = '/homeview';
  static const kSplashScreenOne = '/SplashScreenOne';
  static const kSignUpView = '/SignUpView';
  static const kForgetPassWordView = '/ForgetPassWordView';
  static const kVerifyPassWordView = '/VerifyPassWordView';
  static const kOnBordingView = '/OnBordingView';
  static const khomeView = '/homeView';
  static const kSearchView = '/searchview';
  static const kCreatePost = '/createPost';
  static const kCommunityPage = '/CommunityPage';
  static const kCommentsViewg = '/CommentsView';
  static const kChatbotPag = '/ChatbotPag';
  static const kCourseOverview = '/CourseOverview';
  static const kCustomBottomNavigationBar = '/CustomBottomNavigationBar';
  static const kRecommendedContentView = '/RecommendedContentView';

  static final router = GoRouter(
    routes: [
      GoRoute(
        path: kCourseOverview,
        builder: (context, state) => CourseOverview(),
      ),
      GoRoute(path: kChatbotPag, builder: (context, state) => ChatbotPage()),
      GoRoute(path: kSearchView, builder: (context, state) => SearchView()),
      GoRoute(
        path: kRecommendedContentView,
        builder: (context, state) => RecommendedContentView(),
      ),

      // GoRoute(
      //   path: '/',
      //   builder:
      //       (context, state) => CreatePostProviders.buildWithProviders(
      //         CustomBottomNavigationBar(),
      //       ),
      // ),
      GoRoute(
        path: kCommunityPage,
        builder:
            (context, state) =>
                CreatePostProviders.buildWithProviders(CommunityPage()),
      ),
      // GoRoute(
      //   path: '/',
      //   builder:
      //       (context, state) => BlocProvider(
      //         create: (context) => LoginCubit(),
      //         child: LoginView(),
      //       ),
      // ),
      GoRoute(
        path: kSignUpView,
        builder:
            (context, state) => BlocProvider(
              create: (context) => RegisterCubit(),
              child: SignUpView(),
            ),
      ),
      GoRoute(
        path: kForgetPassWordView,
        builder:
            (context, state) => BlocProvider(
              create: (context) => ForgetPassCubit(),
              child: ForgetPasswordView(),
            ),
      ),
      GoRoute(
        path: kVerifyPassWordView,
        builder:
            (context, state) => BlocProvider(
              create: (context) => VerifyPassCubit(),
              child: VerifyPasswordView(),
            ),
      ),
      GoRoute(
        path: kPasswordResetView,
        builder: (context, state) => PasswordResetView(),
      ),
      GoRoute(
        path: kSetNewPassword,
        builder: (context, state) {
          final extra = state.extra as Map<String, dynamic>;
          final String code = extra['code'];
          final String email = extra['email'];

          return BlocProvider(
            create: (context) => ResetCubit(code, email),
            child: const SetNewPassword(),
          );
        },
      ),
      // GoRoute(path: '/', builder: (context, state) => CommentsView()),
      GoRoute(path: '/', builder: (context, state) => AssessmentView()),
      GoRoute(path: kTestView, builder: (context, state) => TestView()),
      GoRoute(
        path: kTestResultView,
        builder: (context, state) => TestResultView(),
      ),

      // GoRoute(path: '/', builder: (context, state) => LogoView()),
      GoRoute(
        path: kOnBordingView,
        builder: (context, state) => OnBoardingPageview(),
      ),

      GoRoute(path: khomeView, builder: (context, state) => HomeView()),
      GoRoute(
        path: kCreatePost,
        builder:
            (context, state) =>
                CreatePostProviders.buildWithProviders(CreatePostPage()),
      ),
    ],
  );
}
