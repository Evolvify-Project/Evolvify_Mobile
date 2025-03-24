import 'package:evolvify/features/auth/presentation/views/forget_password_view.dart';
import 'package:evolvify/features/auth/presentation/views/login_view.dart';
import 'package:evolvify/features/auth/presentation/views/sign_up_view.dart';
import 'package:evolvify/features/auth/presentation/views/verify_password_view.dart';
import 'package:evolvify/features/splash%20screen/splash_screen_one.dart';
import 'package:go_router/go_router.dart';

abstract class AppRouter {
  static const kHomeView = '/homeview';
  static const kloginView = '/loginView';
  static const kSignUpView = '/SignUpView';
  static const kForgetPassWordView = '/ForgetPassWordView';
  static const kVerifyPassWordView = '/VerifyPassWordView';


  static const kSearchView = '/searchview';
  static final router = GoRouter(
    routes: [
      GoRoute(path: '/', builder: (context, state) => SplashScreenOne()),
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
        
    ],
  );
}
