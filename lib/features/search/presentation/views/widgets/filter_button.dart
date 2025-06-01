import 'package:evolvify/core/utils/app_style.dart';
import 'package:evolvify/core/utils/constant.dart';
import 'package:flutter/material.dart';

class FilterButton extends StatefulWidget {
  FilterButton({
    super.key,
    required this.text,
    this.onTap,
    this.isSelect = false,
  });

  final String text;
  void Function()? onTap;
  bool isSelect;
  @override
  State<FilterButton> createState() => _FilterButtonState();
}

class _FilterButtonState extends State<FilterButton> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: widget.onTap,
      child: Container(
        margin: EdgeInsets.only(left: 9),
        decoration: BoxDecoration(
          color: widget.isSelect ? AppColors.kPrimaryColor : Color(0xffEEECEC),
          borderRadius: BorderRadius.circular(30),
        ),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 4),
          child: Center(
            child: Text(
              widget.text,
              style: TextStyle(
                color: widget.isSelect ? Colors.white : Colors.black,
                fontSize: getResponsiveFontSize(context, fontSize: 18),
                fontWeight: FontWeight.w500,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
