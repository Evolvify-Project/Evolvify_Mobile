import 'package:evolvify/features/AI-Assessment/presentation/views/AI-Assessment_view.dart';
import 'package:evolvify/features/AI-Assessment/presentation/views/Interview_view.dart';
import 'package:evolvify/features/AI-Assessment/presentation/manager/ai_assessment_cubit/ai_assessment_cubit.dart';
import 'package:evolvify/features/AI-Assessment/data/repos/ai_assessment_repository_impl.dart';
import 'package:evolvify/features/Assessment/data/models/question/skill_result.dart';
import 'package:evolvify/features/Assessment/presentation/manager/RecommendCourses_cubit/recommend_courses_cubit.dart';
import 'package:evolvify/features/Assessment/presentation/manager/question_cubit/question_cubit.dart';
import 'package:evolvify/features/Assessment/presentation/manager/submit_ques_cubit/submit_ques_cubit.dart';
import 'package:evolvify/features/Assessment/presentation/views/Recommended_Content_view.dart';
import 'package:evolvify/features/Assessment/presentation/views/assessment_view.dart';
import 'package:evolvify/features/Assessment/presentation/views/test_result_view.dart';
import 'package:evolvify/features/Assessment/presentation/views/test_view.dart';
import 'package:evolvify/features/Courses/presentation/manager/Courses-of_module_cubit/modules_cubit.dart';
import 'package:evolvify/features/Courses/presentation/manager/ModulesOfCourse/modules_of_course_cubit.dart';
import 'package:evolvify/features/Courses/presentation/views/course_overview.dart';
import 'package:evolvify/features/Courses/presentation/views/show_course_text.dart';
import 'package:evolvify/features/Courses/presentation/views/show_course_video.dart';
import 'package:evolvify/features/Premium/presentation/manager/cubit/payment_plans_cubit.dart';
import 'package:evolvify/features/Premium/presentation/manager/cubit/payment_subscription_cubit.dart';
import 'package:evolvify/features/Premium/presentation/views/Premium_view.dart';
import 'package:evolvify/features/Premium/presentation/views/card_number_page.dart';
import 'package:evolvify/features/Premium/presentation/views/payment_method.dart';
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
import 'package:evolvify/features/chatbot _ai/presentation/views/chatbot_page_with_cubit.dart';
import 'package:evolvify/features/community/data/models/post.dart';
import 'package:evolvify/features/community/presentation/manager/comment/comment_cubit.dart';
import 'package:evolvify/features/community/presentation/manager/fetchAllcomments/fetch_allcomments_cubit.dart';
import 'package:evolvify/features/community/presentation/views/comments_view.dart';
import 'package:evolvify/features/community/presentation/views/community_page.dart';
import 'package:evolvify/features/community/presentation/views/create_post.dart';
import 'package:evolvify/features/community/presentation/views/widgets/create_post_providers.dart';
import 'package:evolvify/features/home/presentation/manager/AllCoursesOfSkill/all_courses_of_skill_cubit.dart';
import 'package:evolvify/features/home/presentation/views/allcourse_of_skills_view.dart';
import 'package:evolvify/features/home/presentation/views/home_view.dart';
import 'package:evolvify/features/on_Boarding/on_Boarding_pageview.dart';
import 'package:evolvify/features/quiz/presentation/manager/cubit/quiz_answers_cubit.dart';
import 'package:evolvify/features/quiz/presentation/manager/cubit/quiz_attempts_cubit.dart';
import 'package:evolvify/features/quiz/presentation/manager/cubit/quiz_ques_cubit.dart';
import 'package:evolvify/features/quiz/presentation/manager/cubit/score_cubit.dart';
import 'package:evolvify/features/quiz/presentation/views/quiz_view.dart';
import 'package:evolvify/features/search/presentation/manager/search_cubit/search_cubit.dart';
import 'package:evolvify/features/search/presentation/views/filter_view.dart';
import 'package:evolvify/features/search/presentation/views/search_result_view.dart';
import 'package:evolvify/features/search/presentation/views/search_view.dart';
import 'package:evolvify/features/splash%20screen/splash_screen_one.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

import '../../features/home/presentation/manager/Courses_cubit/courses_cubit.dart';
import '../../features/on_Boarding/presentation/views/logo_view.dart';
import '../widgets/bottom_nav_bar.dart';
import 'package:evolvify/features/AI-Assessment/presentation/views/ai_assessment_evolvisense.dart';

abstract class AppRouter {
  static const klogoView = '/logoView';
  static const kTestView = '/TestView';
  static const kAssessmentView = '/assessmentView';
  static const kTestResultView = '/TestResultView';
  static const kloginView = '/loginView';
  static const kPasswordResetView = '/PasswordResetView';
  static const kSetNewPassword = '/SetNewPassword';
  static const kHomeView = '/homeview';
  static const kPremiumView = '/PremiumView';
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
  static const kInterviewView = '/InterviewView';
  static const kSearchResultView = '/SearchResultView';
  static const kFilterView = '/FilterView';
  static const kShowCourse = '/ShowCourse';
  static const kShowCourseText = '/ShowCourseText';
  static const kAllcourseOfSkillsView = '/AllcourseOfSkillsView';
  static const kPaymentMethod = '/PaymentMethod';
  static const kCardNumberPage = '/CardNumberPage';
  static const kQuizView = '/QuizView';
  static const kAiAssessmentEvolviSense = '/aiAssessmentEvolviSense';
  static const kPresentationTest = '/PresentationTest';
  static const kInterviewTest = '/InterviewTest';
  static const kChatbotPageWithCubit = '/ChatbotPageWithCubit';

  static final router = GoRouter(
    routes: [
      GoRoute(
        path: kCourseOverview,
        builder: (context, state) {
          final id = state.extra as int;
          return BlocProvider(
            create:
                (context) => ModulesOfCourseCubit()..getModulesOfCourse(id: id),
            child: CourseOverview(),
          );
        },
      ),
      GoRoute(
        path: kShowCourseText,
        builder: (context, state) {
          final extra = state.extra as Map<String, dynamic>;
          final moduleId = extra['moduleId'];
          final courseId = extra['courseId'];

          return BlocProvider(
            create:
                (context) =>
                    ModulesCubit()
                      ..getAllModules(courseId: courseId, moduleId: moduleId),
            child: ShowCourseText(),
          );
        },
      ),
      GoRoute(path: kChatbotPag, builder: (context, state) => ChatbotPage()),
      GoRoute(
        path: kCardNumberPage,
        builder: (context, state) => CardNumberPage(),
      ),
      GoRoute(
        path: kQuizView,
        builder:
            (context, state) => MultiBlocProvider(
              providers: [
                BlocProvider(
                  create: (context) => QuizQuesCubit()..getQuestions(quizId: 1),
                ),
                BlocProvider(create: (context) => QuizAnswersCubit()),
                BlocProvider(create: (context) => QuizAttemptsCubit()),
                BlocProvider(create: (context) => ScoreCubit()),
              ],
              child: QuizView(),
            ),
      ),

      GoRoute(
        path: kPaymentMethod,
        builder: (context, state) => PaymentMethod(),
      ),
      GoRoute(
        path: kAllcourseOfSkillsView,
        builder: (context, state) {
          final skillId = state.extra as int;
          return BlocProvider(
            create:
                (context) =>
                    AllCoursesOfSkillCubit()
                      ..getAllCoursesOfSkill(skillId: skillId),
            child: AllcourseOfSkillsView(),
          );
        },
      ),
      GoRoute(
        path: kShowCourse,
        builder: (context, state) {
          final extra = state.extra as Map<String, dynamic>;
          final moduleId = extra['moduleId'];
          final courseId = extra['courseId'];

          return BlocProvider(
            create:
                (context) =>
                    ModulesCubit()
                      ..getAllModules(courseId: courseId, moduleId: moduleId),
            child: ShowCourseVideo(),
          );
        },
      ),
      GoRoute(
        path: kSearchView,
        builder: (context, state) {
          return BlocProvider(
            create: (context) => SearchCubit(),
            child: SearchView(),
          );
        },
      ),
      GoRoute(
        path: kSearchResultView,
        builder: (context, state) {
          final keyword = state.extra as String;

          return BlocProvider.value(
            value: BlocProvider.of<SearchCubit>(context),
            child: SearchResultView(searchquery: keyword),
          );
        },
      ),
      GoRoute(
        path: kFilterView,
        builder: (context, state) {
          return BlocProvider.value(
            value: BlocProvider.of<SearchCubit>(context),
            child: FilterView(),
          );
        },
      ),

      GoRoute(
        path: kInterviewView,
        builder: (context, state) => InterviewView(),
      ),
      GoRoute(
        path: kPremiumView,
        builder:
            (context, state) => MultiBlocProvider(
              providers: [
                BlocProvider(
                  create: (context) => PaymentPlansCubit()..getPaymentPlans(),
                ),
                BlocProvider(create: (context) => PaymentSubscriptionCubit()),
              ],
              child: PremiumView(),
            ),
      ),

      GoRoute(
        path: kRecommendedContentView,
        builder:
            (context, state) => BlocProvider(
              create:
                  (context) => RecommendCoursesCubit()..getRecommendCourses(),
              child: RecommendedContentView(),
            ),
      ),

      GoRoute(
        path: kCustomBottomNavigationBar,
        builder:
            (context, state) => BlocProvider(
              create: (context) => CoursesCubit()..getgetMostWatchingSkill(),
              child: CurvedNavWithImage(),
            ),
      ),
      GoRoute(
        path: kCommunityPage,
        builder:
            (context, state) =>
                CreatePostProviders.buildWithProviders(CommunityPage()),
      ),
      GoRoute(
        path: kChatbotPageWithCubit,
        builder: (context, state) => ChatbotPageWithCubit(),
      ),
      GoRoute(
        path: kInterviewTest,
        builder:
            (context, state) => MultiBlocProvider(
              providers: [
                BlocProvider(create: (context) => LoginCubit()),
                BlocProvider(
                  create:
                      (context) =>
                          AiAssessmentCubit(AiAssessmentRepositoryImpl()),
                ),
              ],
              child: AiAssessmentEvolviSense(
                prompts: [
                  "Tell us about yourself,",
                  "Describe a challenge you overcame.",
                  "What motivates you?",
                ],
                testType: 'Interview Assessment',
              ),
            ),
      ),
      GoRoute(
        path: kPresentationTest,
        builder:
            (context, state) => MultiBlocProvider(
              providers: [
                BlocProvider(create: (context) => LoginCubit()),
                BlocProvider(
                  create:
                      (context) =>
                          AiAssessmentCubit(AiAssessmentRepositoryImpl()),
                ),
              ],
              child: AiAssessmentEvolviSense(
                prompts: [
                  "Introduce yourself,",
                  "What is the main idea of your presentation?",
                  "What is the main message of your presentation?",
                ],
                testType: 'Presentation Assessment',
              ),
            ),
      ),
      GoRoute(
        path: kSignUpView,
        builder:
            (context, state) => BlocProvider(
              create: (context) => RegisterCubit(),
              child: SignUpView(),
            ),
      ),
      GoRoute(
        path: kloginView,
        builder:
            (context, state) => BlocProvider(
              create: (context) => LoginCubit(),
              child: LoginView(),
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
        path: kSplashScreenOne,
        builder: (context, state) => SplashScreenOne(),
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
      GoRoute(
        path: kCommentsViewg,
        builder: (context, state) {
          final postModel = state.extra as PostModel;
          return MultiBlocProvider(
            providers: [
              BlocProvider(create: (context) => CommentCubit()),
              BlocProvider(
                create:
                    (context) =>
                        FetchAllcommentsCubit()..fetchAllComments(postModel.id),
              ),
            ],
            child: CommentsView(postModel: postModel),
          );
        },
      ),

      GoRoute(
        path: kAssessmentView,
        builder: (context, state) => AssessmentView(),
      ),
      GoRoute(
        path: kTestView,
        builder:
            (context, state) => MultiBlocProvider(
              providers: [
                BlocProvider(create: (context) => QuestionCubit()),
                BlocProvider(create: (context) => SubmitQuesCubit()),
              ],
              child: TestView(),
            ),
      ),
      GoRoute(
        path: kTestResultView,
        builder: (context, state) {
          final extra = state.extra;
          if (extra is List<SkillResult>) {
            return TestResultView(skillResult: extra);
          } else {
            return Scaffold(body: Center(child: Text('No results found')));
          }
        },
      ),

      GoRoute(path: '/', builder: (context, state) => LogoView()),
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
      GoRoute(
        path: kAiAssessmentEvolviSense,
        builder: (context, state) {
          final extra = state.extra as Map<String, dynamic>?;
          final testType = extra?['testType'] ?? 'Interview Assessment';
          final prompts =
              extra?['prompts'] ??
              [
                'Tell us about yourself.',
                'Describe a challenge you overcame.',
                'What motivates you?',
              ];
          final durationPerPrompt = extra?['durationPerPrompt'] ?? 30;

          return BlocProvider.value(
            value: BlocProvider.of<AiAssessmentCubit>(context),
            child: AiAssessmentEvolviSense(
              testType: testType,
              prompts: prompts,
              durationPerPrompt: durationPerPrompt,
            ),
          );
        },
      ),
    ],
  );
}
