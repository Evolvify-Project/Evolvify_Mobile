import 'package:evolvify/core/utils/app_style.dart';
import 'package:evolvify/core/utils/constant.dart';
import 'package:flutter/material.dart';
import 'package:svg_flutter/svg_flutter.dart';

class ContactCard extends StatefulWidget {
  const ContactCard({
    super.key,

    required this.title,
    required this.subTitle,
    required this.image,

    required this.selected,
  });
  final String title, subTitle, image;

  final bool selected;

  @override
  State<ContactCard> createState() => _ContactCardState();
}

class _ContactCardState extends State<ContactCard> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        setState(() {});
      },
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(22),
          border: Border.all(
            width: 3,
            color: widget.selected ? AppColors.kPrimaryColor : Colors.grey,
          ),
        ),

        child: Padding(
          padding: const EdgeInsets.only(top: 6, bottom: 15),
          child: ListTile(
            leading: Padding(
              padding: const EdgeInsets.only(left: 15, top: 7),
              child: SvgPicture.asset(widget.image),
            ),
            title: Center(
              child: Padding(
                padding: const EdgeInsets.only(bottom: 6),
                child: Text(
                  widget.title,
                  style: AppStyle.styleNexa15(context).copyWith(
                    fontSize: getResponsiveFontSize(context, fontSize: 14),
                  ),
                ),
              ),
            ),
            subtitle: Center(
              child: Text(
                widget.subTitle,
                style: AppStyle.styleNexa15(
                  context,
                ).copyWith(color: AppColors.kPrimaryColor),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
