import 'package:evolvify/core/utils/app_style.dart';
import 'package:evolvify/core/utils/constant.dart';
import 'package:flutter/material.dart';

class FilterButton extends StatefulWidget {
  const FilterButton({super.key, required this.text});

  final String text;
  @override
  State<FilterButton> createState() => _FilterButtonState();
}

class _FilterButtonState extends State<FilterButton> {
  final bool isSelect = false;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        setState(() {
          isSelect == true;
        });
      },
      child: Container(
        margin: EdgeInsets.only(left: 9),
        decoration: BoxDecoration(
          color: isSelect ? AppColors.kPrimaryColor : Color(0xffEEECEC),
          borderRadius: BorderRadius.circular(30),
        ),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 4),
          child: Center(
            child: Text(
              widget.text,
              style: TextStyle(
                color: isSelect ? Colors.white : Colors.black,
                fontSize:getResponsiveFontSize(context, fontSize: 18),
                fontWeight: FontWeight.w500,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
