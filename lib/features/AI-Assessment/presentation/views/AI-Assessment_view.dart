import 'dart:io';
import 'package:evolvify/core/utils/app_images.dart';
import 'package:evolvify/core/utils/app_router.dart';
import 'package:evolvify/core/utils/app_style.dart';
import 'package:evolvify/core/utils/constant.dart';
import 'package:evolvify/core/widgets/custom_button.dart';
import 'package:evolvify/features/AI-Assessment/presentation/views/widgets/PremiumSection.dart';
import 'package:evolvify/features/AI-Assessment/presentation/views/widgets/emotional_State.dart';
import 'package:evolvify/features/AI-Assessment/presentation/manager/ai_assessment_cubit/ai_assessment_cubit.dart';
import 'package:evolvify/features/AI-Assessment/presentation/manager/ai_assessment_cubit/ai_assessment_state.dart';
import 'package:evolvify/features/AI-Assessment/presentation/views/analysis_results_view.dart';
import 'package:evolvify/features/AI-Assessment/presentation/views/ai_assessment_evolvisense.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:image_picker/image_picker.dart';

class AiassessmentView extends StatelessWidget {
  const AiassessmentView({super.key});

  @override
  Widget build(BuildContext context) {
    final cubit = BlocProvider.of<AiAssessmentCubit>(context);
    print('AI Assessment View: Cubit available: ${cubit != null}');

    return Scaffold(
      appBar: AppBar(
        title: const Text('AI Assessment'),
        backgroundColor: AppColors.kPrimaryColor,
        foregroundColor: Colors.white,
      ),
      body: BlocProvider.value(
        value: cubit,
        child: BlocListener<AiAssessmentCubit, AiAssessmentState>(
          listener: (context, state) {
            print('AI Assessment View: State changed to: ${state.runtimeType}');
            print('AI Assessment View: State details: $state');

            if (state is Error) {
              print('AI Assessment View: Error state: ${state.message}');
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(
                  content: Text(state.message),
                  backgroundColor: Colors.red,
                ),
              );
            } else if (state is VideoAnalysisSuccess) {
              print(
                'AI Assessment View: Video analysis success, navigating to results',
              );
              print('AI Assessment View: Result data: ${state.result}');
              // Navigate to results page with the analysis result
              Navigator.of(context).push(
                MaterialPageRoute(
                  builder:
                      (context) => AnalysisResultsView(
                        videoAnalysisResult: state.result,
                      ),
                ),
              );
            } else if (state is EmotionStreamSuccess) {
              print('AI Assessment View: Emotion stream success');
              // Optionally handle real-time emotion data here, or show a dialog/snackbar
            }
          },
          child: SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Column(
                children: [
                  SizedBox(height: 35),
                  UpgradetoPremiumSection(),
                  SizedBox(height: 50),
                  Image.asset(Assets.imagesSelectCamera),
                  SizedBox(height: 18),
                  Text(
                    'Try Now',
                    style: TextStyle(
                      fontWeight: FontWeight.w600,
                      color: AppColors.kPrimaryColor,
                      fontSize: getResponsiveFontSize(context, fontSize: 26),
                    ),
                  ),
                  SizedBox(height: 18),
                  Text(
                    'Enhance your soft skills through immersive \n                                     simulations.',
                    style: TextStyle(
                      color: Color(0xff92919A),
                      fontWeight: FontWeight.w400,
                      fontSize: getResponsiveFontSize(context, fontSize: 16),
                    ),
                  ),
                  SizedBox(height: 50),
                  BlocBuilder<AiAssessmentCubit, AiAssessmentState>(
                    builder: (context, state) {
                      return Column(
                        children: [
                          CustomButton(
                            title:
                                state is Loading
                                    ? 'Analyzing...'
                                    : 'Start Presentation Analysis',
                            borderRadius: 15,
                            onTap:
                                state is Loading
                                    ? null
                                    : () => _startPresentationTest(context),
                          ),
                          SizedBox(height: 17),
                          CustomButton(
                            title:
                                state is Streaming
                                    ? 'Stop Stream'
                                    : 'Start Interview Analysis',
                            borderRadius: 15,
                            onTap: () {
                              if (state is Streaming) {
                                context
                                    .read<AiAssessmentCubit>()
                                    .stopEmotionStream();
                              } else {
                                context
                                    .read<AiAssessmentCubit>()
                                    .startEmotionStream();
                                _startInterviewTest(context);
                              }
                            },
                          ),
                          SizedBox(height: 17),
                          // New EvolviSense-style assessment
                          CustomButton(
                            title: 'Start EvolviSense Assessment',
                            borderRadius: 15,
                            onTap: () => _startEvolviSenseAssessment(context),
                          ),
                          SizedBox(height: 17),
                          // Debug button to test cubit
                          CustomButton(
                            title: 'Test Mock Analysis',
                            borderRadius: 15,
                            onTap: () => _testMockAnalysis(context),
                          ),
                          SizedBox(height: 17),
                          CustomButton(
                            title: 'Test Cubit',
                            borderRadius: 15,
                            onTap: () => _testCubit(context),
                          ),
                        ],
                      );
                    },
                  ),
                  SizedBox(height: 20), // Add bottom padding for scroll
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  void _startEvolviSenseAssessment(BuildContext context) {
    // Mock prompts for the assessment
    final List<String> interviewPrompts = [
      "Tell me about yourself and your background.",
      "What are your greatest strengths and weaknesses?",
      "How do you handle stress and pressure?",
      "Where do you see yourself in five years?",
      "Why should we hire you for this position?",
    ];

    // Navigate using the router
    GoRouter.of(context).push(
      AppRouter.kAiAssessmentEvolviSense,
      extra: {
        'testType': 'Interview Assessment',
        'prompts': interviewPrompts,
        'durationPerPrompt': 30,
      },
    );
  }

  Future<void> _pickVideoAndAnalyze(BuildContext context) async {
    print('AI Assessment View: Starting video picker');
    final ImagePicker picker = ImagePicker();
    final XFile? video = await picker.pickVideo(source: ImageSource.gallery);

    if (video != null) {
      print('AI Assessment View: Video selected: ${video.path}');
      final File videoFile = File(video.path);
      print('AI Assessment View: Calling cubit analyzeVideo');
      context.read<AiAssessmentCubit>().analyzeVideo(videoFile: videoFile);
    } else {
      print('AI Assessment View: No video selected');
    }
  }

  void _testMockAnalysis(BuildContext context) {
    print('AI Assessment View: Testing mock analysis');
    // Create a temporary file for testing
    final tempFile = File('/tmp/test_video.mp4');
    context.read<AiAssessmentCubit>().analyzeVideo(videoFile: tempFile);
  }

  void _testCubit(BuildContext context) {
    print('AI Assessment View: Testing cubit state emission');
    final cubit = context.read<AiAssessmentCubit>();
    print('AI Assessment View: Current state: ${cubit.state.runtimeType}');
    // Test if we can emit a simple state
    cubit.emit(const Loading());
    print('AI Assessment View: Emitted Loading state');
  }

  void _startPresentationTest(BuildContext context) {
    print('AI Assessment View: Starting presentation test');
    GoRouter.of(context).push(AppRouter.kPresentationTest);
  }

  void _startInterviewTest(BuildContext context) {
    print('AI Assessment View: Starting interview test');
    GoRouter.of(context).push(AppRouter.kInterviewTest);
  }
}
