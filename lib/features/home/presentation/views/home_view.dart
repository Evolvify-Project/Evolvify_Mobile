import 'package:evolvify/core/utils/app_style.dart';
import 'package:evolvify/core/utils/constant.dart';
import 'package:evolvify/features/home/presentation/views/widgets/Ccustom_header_homePage.dart';
import 'package:evolvify/core/widgets/customSearch.dart';
import 'package:flutter/material.dart';
import 'package:svg_flutter/svg.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 28),
        child: Column(
          children: [
            SizedBox(height: 28),
            CustomHeaderHomePage(),
            SizedBox(height: 26),
            CustOmSearch(),
            SizedBox(height: 10),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text('Most watching ', style: AppStyle.styleBold22),
                Text('see more', style: AppStyle.styleRegularGrey14),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

// import 'package:evolvify/core/utils/app_images.dart';

// import 'package:evolvify/core/utils/constant.dart';
// import 'package:flutter/material.dart';
// import 'package:curved_navigation_bar/curved_navigation_bar.dart';
// import 'package:svg_flutter/svg.dart';

// void main() {
//   runApp(const MyApp());
// }

// class MyApp extends StatelessWidget {
//   const MyApp({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(debugShowCheckedModeBanner: false, home: HomeScreen());
//   }
// }

// class HomeScreen extends StatefulWidget {
//   @override
//   _HomeScreenState createState() => _HomeScreenState();
// }

// class _HomeScreenState extends State<HomeScreen> {
//   int selectedIndex = 0;

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: Center(child: Text("8888", style: TextStyle(fontSize: 24))),
//       bottomNavigationBar: CurvedNavigationBar(
//         color: AppColors.kPrimaryColor,
//         backgroundColor: Colors.white,
//         buttonBackgroundColor: AppColors.kPrimaryColor,

//         items: [
//           SvgPicture.asset(AppImage.imagesHome),
//           SvgPicture.asset(AppImage.imagesOpenAILogo),

//           SvgPicture.asset(AppImage.imagesLock),
//           SvgPicture.asset(AppImage.imagesProfile),
//         ],
//         index: selectedIndex,
//         onTap: (index) {
//           selectedIndex = index;
//           print(selectedIndex);
//           setState(() {});
//         },
//       ),
//     );
//   }
// }
