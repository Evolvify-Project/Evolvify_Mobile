
import 'package:evolvify/core/utils/app_images.dart';
import 'package:evolvify/core/utils/app_style.dart';
import 'package:flutter/material.dart';

class UpgradetoPremiumSection extends StatelessWidget {
  const UpgradetoPremiumSection({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
    
      decoration: BoxDecoration(
        border: Border.all(color: Colors.black),
        borderRadius: BorderRadius.circular(10),
        image: DecorationImage(
          image: AssetImage(Assets.imagesPremium),
          fit: BoxFit.cover,
        ),
      ),
      child: Column(
        children: [
          Align(
            alignment: Alignment.topRight,
            child: Padding(
              padding: const EdgeInsets.only(right: 12, top: 8),
              child: Icon(Icons.close, color: Colors.white),
            ),
          ),
    
          Padding(
            padding: const EdgeInsets.only(left: 29),
            child: Row(
              children: [
                Image.asset(Assets.imagesTag),
                SizedBox(width: 10),
                Text(
                  'Upgrade to Premium',
                  style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                    fontSize: getResponsiveFontSize(
                      context,
                      fontSize: 24,
                    ),
                  ),
                ),
              ],
            ),
          ),
          SizedBox(height: 7),
          Text(
            'Upgrade to Premium for Advanced Insights!',
            style: TextStyle(
              color: Colors.white,
              fontWeight: FontWeight.w500,
              fontSize: getResponsiveFontSize(context, fontSize: 14),
            ),
          ),
          SizedBox(height: 26),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 58),
            child: SizedBox(
              height: 33,
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(5),
                  ),
                  elevation: 0,
                  backgroundColor: Colors.black,
                ),
                onPressed: () {},
                child: Center(
                  child: Text(
                    'Subscribe Now',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: getResponsiveFontSize(
                        context,
                        fontSize: 16,
                      ),
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ),
              ),
            ),
          ),
          SizedBox(height: 20),
        ],
      ),
    );
  }
}
