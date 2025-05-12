import 'package:evolvify/core/utils/app_style.dart';
import 'package:flutter/material.dart';

class SearchItem extends StatelessWidget {
  const SearchItem({super.key, required this.text});
  final String text;
  @override
  Widget build(BuildContext context) {
    return ListTile(
      contentPadding: EdgeInsets.all(0),
      title: Text(
        text,
        style: TextStyle(
          color: Color(0xff8E9091),
          fontSize: getResponsiveFontSize(context, fontSize: 18),
          fontWeight: FontWeight.w400,
        ),
      ),
      trailing: Image.asset('assets/images/xp.png'),
    );
  }
}
