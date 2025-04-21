import 'package:evolvify/core/utils/app_images.dart';
import 'package:evolvify/core/utils/constant.dart';
import 'package:evolvify/features/chatbot%20_ai/presentation/views/chatbot_page.dart';
import 'package:evolvify/features/home/presentation/views/home_view.dart';
import 'package:flutter/material.dart';
import 'package:svg_flutter/svg.dart';

class CustomBottomNavigationBar extends StatefulWidget {
  @override
  _CustomBottomNavigationBarState createState() =>
      _CustomBottomNavigationBarState();
}

class _CustomBottomNavigationBarState extends State<CustomBottomNavigationBar> {
  int _currentIndex = 0;

  final List<Widget> _pages = [HomeView(), ChatbotPage()];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _pages[_currentIndex],

      // floatingActionButton: Container(
      //   margin: EdgeInsets.only(bottom: 30),
      //   padding: EdgeInsets.all(20), // padding حوالين الزر
      //   decoration: BoxDecoration(
      //     shape: BoxShape.circle,
      //     color: Colors.white, // الخلفية حوالين الزر
      //   ),
      //   child: FloatingActionButton(
      //     shape: CircleBorder(),
      //     backgroundColor: Color(0xff98D1FF),
      //     onPressed: () {},
      //     child: SvgPicture.asset(Assets.imagesCamera),
      //   ),
      // ),

      // floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      bottomNavigationBar: Container(
        height: 80,
        decoration: BoxDecoration(
          color: AppColors.kPrimaryColor,
          borderRadius: BorderRadius.only(),
        ),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              _buildBottomNavItem(Assets.imagesHome, 'Home', 0),
              _buildBottomNavItem(Assets.imagesChatbotImage, 'Chatbot', 1),
              _buildBottomNavItem(Assets.imagesCamera, 'camera', 2),
              _buildBottomNavItem(Assets.imagesCommunity, 'Community', 3),
              _buildBottomNavItem(Assets.imagesProfile, 'Profile', 4),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildBottomNavItem(String imagePath, String label, int index) {
    return GestureDetector(
      onTap: () {
        setState(() {
          _currentIndex = index;
        });
      },
      child: Column(
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          SvgPicture.asset(
            imagePath, // Replace with the appropriate image path
            width: 24,
            height: 24,
            color: _currentIndex == index ? Color(0xff98D1FF) : Colors.white,
          ),
          SizedBox(height: 6),
          Text(
            label,
            style: TextStyle(
              color: _currentIndex == index ? Color(0xff98D1FF) : Colors.white,
              fontSize: 12,
            ),
          ),
        ],
      ),
    );
  }
}
