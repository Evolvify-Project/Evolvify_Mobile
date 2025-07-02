import 'package:evolvify/core/utils/app_style.dart';
import 'package:evolvify/core/utils/constant.dart';
import 'package:flutter/material.dart';

class CardFormScreen extends StatefulWidget {
  @override
  _CardFormScreenState createState() => _CardFormScreenState();
}

class _CardFormScreenState extends State<CardFormScreen> {
  final _cardNumberController = TextEditingController();
  final _expiryController = TextEditingController();
  final _cvvController = TextEditingController();
  final _nameController = TextEditingController();

  bool _saveCard = false;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        _buildTextField(
          label: 'Card Number',
          hint: '4966 0000 0000 0000',
          controller: _cardNumberController,
          icon: Icons.credit_card,
          keyboardType: TextInputType.number,
        ),
        const SizedBox(height: 25),

        Row(
          children: [
            Expanded(
              child: _buildTextField(
                label: 'Expiry Date',
                hint: 'MM/YY',
                controller: _expiryController,
                icon: Icons.calendar_today,
                keyboardType: TextInputType.datetime,
              ),
            ),
            const SizedBox(width: 16),
            Expanded(
              child: _buildTextField(
                label: 'CVV',
                hint: '***',
                controller: _cvvController,
                icon: Icons.lock,
                keyboardType: TextInputType.number,
                obscureText: true,
              ),
            ),
          ],
        ),
        const SizedBox(height: 25),

        _buildTextField(
          label: "Cardholder’s Name",
          hint: "Enter cardholder’s full name",
          controller: _nameController,
          icon: Icons.person_outline,
        ),
        const SizedBox(height: 24),

        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Switch(
              value: _saveCard,
              onChanged: (value) {
                setState(() {
                  _saveCard = value;
                });
              },
              activeColor: Colors.white,
              activeTrackColor: AppColors.kPrimaryColor,
            ),
            const SizedBox(width: 18),
            Text(
              "Save my card",
              style: TextStyle(
                fontSize: getResponsiveFontSize(context, fontSize: 18),
                color: Color(0xff545E7D),
              ),
            ),
          ],
        ),
      ],
    );
  }

  Widget _buildTextField({
    required String label,
    required String hint,
    required TextEditingController controller,
    required IconData icon,
    TextInputType keyboardType = TextInputType.text,
    bool obscureText = false,
  }) {
    return TextFormField(
      controller: controller,
      keyboardType: keyboardType,
      obscureText: obscureText,
      decoration: InputDecoration(
        labelText: label,
        labelStyle: TextStyle(
          fontSize: getResponsiveFontSize(context, fontSize: 14),
          color: AppColors.kPrimaryColor,
        ),
        hintText: hint,
        hintStyle: TextStyle(
          fontSize: getResponsiveFontSize(context, fontSize: 12),
          color: Color(0xffCBD0DC),
        ),
        floatingLabelBehavior: FloatingLabelBehavior.always,
        suffixIcon: Icon(icon),
        suffixIconColor: Color(0xffCBD0DC),
        enabledBorder: OutlineInputBorder(
          borderSide: BorderSide(color: AppColors.kPrimaryColor),
          borderRadius: BorderRadius.circular(12),
        ),

        focusedBorder: OutlineInputBorder(
          borderSide: BorderSide(color: AppColors.kPrimaryColor),
          borderRadius: BorderRadius.circular(12),
        ),
      ),
    );
  }
}
