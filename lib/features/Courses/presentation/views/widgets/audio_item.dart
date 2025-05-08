import 'package:evolvify/core/utils/app_style.dart';
import 'package:evolvify/features/Courses/presentation/views/widgets/show_course_complete.dart';
import 'package:flutter/material.dart';

class AudioItem extends StatefulWidget {
  const AudioItem({this.text, this.timeLessons, super.key});

  final String? text;
  final String? timeLessons;
  @override
  State<AudioItem> createState() => AudioItemState();
}

class AudioItemState extends State<AudioItem> {
  bool isClicked = false;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      contentPadding: EdgeInsets.symmetric(horizontal: 12),
      onTap: () {
        setState(() {
          // isClicked = true;
          // showCourseComplete(context);
          // Navigator.push(
          //   context,
          //   MaterialPageRoute(
          //     builder: (context) {
          //       // return VideoPage();
          //       return Text('');
          //     },
          //   ),
          // );
        });
      },
      leading: Container(
        padding: const EdgeInsets.all(11),
        decoration: BoxDecoration(
          color: isClicked ? Color(0xffFF7401) : Colors.white,
          shape: BoxShape.circle,
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withValues(alpha: 0.15),
              spreadRadius: 4,
              blurRadius: 5,
              offset: Offset(0, 4),
            ),
          ],
        ),
        child: Icon(
          Icons.play_arrow_rounded,
          color: isClicked ? Colors.white : Color(0xffFF7401),
          size: 26,
        ),
      ),
      title: Text(
        widget.text!,
        style: TextStyle(
          fontSize: getResponsiveFontSize(context, fontSize: 16),
          color: Colors.black,
          fontWeight: FontWeight.w600,
        ),
      ),
      subtitle: Text(
        widget.timeLessons!,
        style: TextStyle(
          fontSize: getResponsiveFontSize(context, fontSize: 16),
          color: Color(0xffAEAEAE),
          fontWeight: FontWeight.w400,
        ),
      ),
      trailing: Transform.rotate(
        angle: -1.57079633 * 2,
        child: Icon(
          Icons.arrow_back_ios_new_outlined,
          color: const Color(0xFF233A66),
        ),
      ),
    );
  }
}
