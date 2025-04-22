import 'package:flutter/material.dart';

class SearchItem extends StatelessWidget {
  const SearchItem({super.key});

  @override
  Widget build(BuildContext context) {
    return  ListTile(
      contentPadding: EdgeInsets.all(0),
      title: Text(
        'Interview Skills',
        style: TextStyle(
          color: Color(0xff8E9091),
          fontSize: 18,
          fontWeight: FontWeight.w400,
        ),
      ),
      trailing: Image.asset('assets/images/xp.png'),
    );
  }
}
