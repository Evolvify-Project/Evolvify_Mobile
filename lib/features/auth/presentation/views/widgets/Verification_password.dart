import 'package:evolvify/core/utils/app_style.dart';
import 'package:evolvify/core/utils/constant.dart';
import 'package:evolvify/core/widgets/custom_button.dart';
import 'package:evolvify/features/auth/presentation/views/widgets/show_Password_Reset_Dialog.dart';
import 'package:evolvify/features/auth/presentation/views/widgets/text_field_code.dart';
import 'package:flutter/material.dart';

class VerityPassword extends StatefulWidget {
  const VerityPassword({super.key});

  @override
  State<VerityPassword> createState() => _VerityPasswordState();
}

class _VerityPasswordState extends State<VerityPassword> {
  final List<TextEditingController> controllers = List.generate(
    4,
    (_) => TextEditingController(),
  );
  int fillBox = 0;
  void onChange(String value, int index) {
    if (value.length == 1) {
      setState(() {
        fillBox++;
      });
      if (index < controllers.length - 1) {
        FocusScope.of(context).nextFocus();
      }
    } else if (value.isEmpty) {
      setState(() {
        fillBox--;
      });
      if (index > 0) {
        FocusScope.of(context).previousFocus();
      }
    }
  }

  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.center,

          children: List.generate(4, (index) {
            return Padding(
              padding: const EdgeInsets.symmetric(horizontal: 12),
              child: TextFieldCode(
                controllers: controllers[index],
                onChanged: (value) {
                  onChange(value, index);
                },
              ),
            );
          }),
        ),
        SizedBox(height: 52),

        SizedBox(height: 25),
        LinearProgressIndicator(
          value: fillBox / 4,
          backgroundColor: Color(0xffCBCBCB),
          color: AppColors.kPrimaryColor,
        ),
        SizedBox(height: 21),
        CustomButton(
          borderRadius: 25,
          title: 'Verify',
          onTap: () {
            fillBox == 4 ? verifyCode : null;
            showPasswordResetDialog(context);
          },
        ),
        SizedBox(height: 21),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text('Didn’t Receive the Code ?', style: AppStyle.styleMedium14),
            Text(
              '   Resend Code',
              style: AppStyle.styleMedium28.copyWith(fontSize: 12),
            ),
          ],
        ),
      ],
    );
  }

  void verifyCode() {}
}
