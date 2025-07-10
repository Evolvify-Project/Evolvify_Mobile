import 'package:evolvify/core/utils/app_images.dart';
import 'package:flutter/material.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xffF4F7FE),
      appBar: AppBar(
        backgroundColor: Color(0xffF4F7FE),
        elevation: 0, // بدون ظل

        actions: [
          IconButton(
            icon: Icon(Icons.notifications_none, color: Color(0xff202244)),
            onPressed: () {
              // Handle notification tap
            },
          ),
        ],
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Column(
            children: [
              SizedBox(height: 20),

              CircleAvatar(
                radius: 50,
                backgroundImage: AssetImage(Assets.imagesProfileImage),
              ),
              SizedBox(height: 10),
              Text(
                'Jess Bailey',
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.w700,
                  color: Color(0xff202244),
                ),
              ),
              SizedBox(height: 8),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text('17', style: TextStyle(fontWeight: FontWeight.bold)),
                  SizedBox(width: 5),
                  Text('Follower'),
                  SizedBox(width: 20),
                  Text('270', style: TextStyle(fontWeight: FontWeight.bold)),
                  SizedBox(width: 5),
                  Text('Following'),
                ],
              ),
              SizedBox(height: 25),
              Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  'User Progress',
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                    color: Color(0xff5F00BA),
                  ),
                ),
              ),
              SizedBox(height: 16),
              Row(
                children: [
                  _buildProgressCard(
                    context,
                    title: 'Starting Level',
                    subtitle: '(intermediate)',
                    percent: '64%',
                  ),
                  SizedBox(width: 12),
                  _buildProgressCard(
                    context,
                    title: 'Current Level',
                    subtitle: '(Advanced)',
                    percent: '86%',
                  ),
                ],
              ),
              SizedBox(height: 25),
              Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  'Favorite topic',
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                    color: Color(0xff202244),
                  ),
                ),
              ),
              SizedBox(height: 10),
              ClipRRect(
                borderRadius: BorderRadius.circular(16),
                child: Stack(
                  children: [
                    Image.asset(
                      Assets.imagesProfileImage,
                      width: double.infinity,
                      height: 150,
                      fit: BoxFit.cover,
                    ),
                    Positioned(
                      left: 20,
                      bottom: 20,
                      child: Text(
                        'Interview',
                        style: TextStyle(
                          fontSize: 22,
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                          shadows: [
                            Shadow(
                              blurRadius: 5,
                              color: Colors.black54,
                              offset: Offset(1, 2),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(height: 40),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildProgressCard(
    BuildContext context, {
    required String title,
    required String subtitle,
    required String percent,
  }) {
    return Expanded(
      child: Container(
        height: 120,
        padding: const EdgeInsets.all(16),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(16),
          boxShadow: [
            BoxShadow(
              color: Colors.black12,
              blurRadius: 10,
              offset: Offset(2, 2),
            ),
          ],
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('$title ', style: TextStyle(fontWeight: FontWeight.w500)),
            Text(
              subtitle,
              style: TextStyle(
                color: Colors.green,
                fontWeight: FontWeight.w500,
              ),
            ),
            Spacer(),
            Text(
              percent,
              style: TextStyle(
                fontSize: 22,
                fontWeight: FontWeight.bold,
                color: Color(0xff202244),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
