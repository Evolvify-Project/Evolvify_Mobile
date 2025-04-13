import 'package:evolvify/core/widgets/bottom_nav_bar.dart';
import 'package:evolvify/features/auth/presentation/views/forget_password_view.dart';
import 'package:evolvify/features/auth/presentation/views/login_view.dart';
import 'package:evolvify/features/auth/presentation/views/sign_up_view.dart';
import 'package:evolvify/features/auth/presentation/views/verify_password_view.dart';
import 'package:evolvify/features/community/presentation/views/community_page.dart';
import 'package:evolvify/features/community/presentation/views/create_post.dart';
import 'package:evolvify/features/community/presentation/views/widgets/create_post_providers.dart';
import 'package:evolvify/features/home/presentation/views/home_view.dart';
import 'package:evolvify/features/on_Boarding/on_Boarding_pageview.dart';
import 'package:evolvify/features/on_Boarding/presentation/views/logo_view.dart';
import 'package:evolvify/features/on_Boarding/presentation/views/widgets/on_boarding_view.dart';
import 'package:evolvify/features/splash%20screen/splash_screen_one.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

abstract class AppRouter {
  static const kloginView = '/loginView';
  static const kHomeView = '/homeview';
  static const kSplashScreenOne = '/SplashScreenOne';
  static const kSignUpView = '/SignUpView';
  static const kForgetPassWordView = '/ForgetPassWordView';
  static const kVerifyPassWordView = '/VerifyPassWordView';
  static const kOnBordingView = '/OnBordingView';
  static const khomeView = '/homeView';
  static const kSearchView = '/searchview';
  static const kCreatePost = '/createPost';
  static final router = GoRouter(
    routes: [
      GoRoute(
        path: '/',
        builder:
            (context, state) => MultiBlocProvider(
              providers: CreatePostProviders.providers(context),
              child: CommunityPage(),
            ),
      ),
      GoRoute(path: kloginView, builder: (context, state) => LoginView()),
      GoRoute(path: kSignUpView, builder: (context, state) => SignUpView()),
      GoRoute(
        path: kForgetPassWordView,
        builder: (context, state) => ForgetPasswordView(),
      ),
      GoRoute(
        path: kVerifyPassWordView,
        builder: (context, state) => VerifyPasswordView(),
      ),
      GoRoute(
        path: kSplashScreenOne,
        builder: (context, state) => SplashScreenOne(),
      ),
      GoRoute(
        path: kOnBordingView,
        builder: (context, state) => OnBoardingPageview(),
      ),
      GoRoute(path: khomeView, builder: (context, state) => HomeView()),
      GoRoute(
        path: kCreatePost,
        builder:
            (context, state) => MultiBlocProvider(
              providers: CreatePostProviders.providers(context),
              child: CreatePostPage(),
            ),
      ),
    ],
  );
}
