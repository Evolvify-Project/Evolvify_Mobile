import 'package:evolvify/core/utils/app_images.dart';
import 'package:evolvify/core/utils/constant.dart';
import 'package:flutter/material.dart';
import 'package:svg_flutter/svg_flutter.dart';

class BottomNavBar extends StatefulWidget {
  @override
  _BottomNavBarState createState() => _BottomNavBarState();
}

class _BottomNavBarState extends State<BottomNavBar> {
  int _selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: BottomAppBar(
        height: 60,
        shape: CircularNotchedRectangle(),

        color: Color(0xFF1D3557), // Dark blue
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            IconButton(
              icon: SvgPicture.asset(Assets.imagesFacebook),
              onPressed: () {},
            ),
            IconButton(
              icon: SvgPicture.asset(Assets.imagesFacebook),
              onPressed: () {},
            ),
            SizedBox(width: 48),
            IconButton(
              icon: SvgPicture.asset(Assets.imagesFacebook),
              onPressed: () {},
            ),
            IconButton(
              icon: SvgPicture.asset(Assets.imagesFacebook),
              onPressed: () {},
            ),
          ],
        ),
      ),
      floatingActionButton: Padding(
        padding: const EdgeInsets.all(8.0),
        child: FloatingActionButton(
          shape: CircleBorder(),
          onPressed: () {},
          backgroundColor: AppColors.kbottomNavColor,
          child: SvgPicture.asset(Assets.imagesFacebook),
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
    );
  }
}

