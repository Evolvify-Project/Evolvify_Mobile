import 'package:evolvify/core/utils/app_images.dart';

import 'package:evolvify/features/on_Boarding/model/on_Boarding_model.dart';
import 'package:evolvify/features/on_Boarding/presentation/views/widgets/on_boarding_view.dart';
import 'package:flutter/material.dart';

class OnBoardingPageview extends StatefulWidget {
  OnBoardingPageview({super.key});

  @override
  static List items = [
    OnBoardingModel(
      image: Assets.imagesRectangle1,
      titlt: 'Learn in a Modern Way',
      desc:
          'Courses are designed interactively to '
          'help you master practical skills efficiently '
          'and effectively',
    ),
    OnBoardingModel(
      image: Assets.imagesRectangle2,
      titlt: 'Choose What Suits You!',
      desc:
          'Access personalized courses '
          'tailored to your professional and '
          'personal growth needs',
    ),
    OnBoardingModel(
      image: Assets.imagesRectangle3,
      titlt: 'Your Smart  AI Chatbot',
      desc:
          'Chat with the Evolvify AI assistant to '
          'get personalized course recommendations '
          'and answers to your questions',
    ),
    OnBoardingModel(
      image: Assets.imagesRectangle4,
      titlt: 'Ready to Begin?',
      desc:
          'Start your journey with Evolvify today'
          'and develop your skills! ',
    ),
  ];

  @override
  State<OnBoardingPageview> createState() => _OnBoardingPageviewState();
}

class _OnBoardingPageviewState extends State<OnBoardingPageview> {
  int pageViewIndex = 0;
  PageController? pageController = PageController();
  Widget build(BuildContext context) {
    return PageView.builder(
      onPageChanged: (index) {
        setState(() {
          pageViewIndex = index;
        });
        print(pageViewIndex);
      },
      controller: pageController,
      scrollDirection: Axis.horizontal,
      itemCount: OnBoardingPageview.items.length,
      itemBuilder: (BuildContext comtext, index) {
        return OnBoardingView(
          index: pageViewIndex,
          onBoardingModel: OnBoardingPageview.items[index],
          onTapNext: () {
            pageController!.jumpToPage(pageViewIndex++);
          },
          onPressedSkip: () {
            if (pageViewIndex == 0) {
              pageController!.jumpToPage(3);
            } else {
              pageController!.jumpToPage(pageViewIndex--);
            }
          },
        );
      },
    );
  }
}
