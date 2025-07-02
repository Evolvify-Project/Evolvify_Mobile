import 'package:evolvify/core/utils/app_images.dart';
import 'package:evolvify/core/utils/constant.dart';
import 'package:flutter/material.dart';

class PaymentSelection extends StatefulWidget {
  const PaymentSelection({super.key});

  @override
  State<PaymentSelection> createState() => _PaymentSelectionState();
}

enum PaymentMethod { paypal, creditCard, wallet }

class _PaymentSelectionState extends State<PaymentSelection> {
  PaymentMethod _selectedMethod = PaymentMethod.creditCard;
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Color.fromARGB(255, 240, 238, 238),
        borderRadius: BorderRadius.circular(16),
        boxShadow: [BoxShadow(color: Colors.black12, blurRadius: 10)],
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          _buildPaymentTile(
            method: PaymentMethod.paypal,
            title: 'Paypal',
            subtitle: '**** 0345 3455',
            icon: Image.asset(Assets.imagesPaypal),
          ),

          _buildPaymentTile(
            method: PaymentMethod.creditCard,
            title: 'Credit Card',
            subtitle: '**** 0345 3455',
            icon: Image.asset(Assets.imagesMastercard),
          ),

          _buildPaymentTile(
            method: PaymentMethod.wallet,
            title: 'Wallet',
            subtitle: '**** ****',
            icon: Image.asset(Assets.imagesWalletSvgrepoCom),
          ),
        ],
      ),
    );
  }

  Widget _buildPaymentTile({
    required PaymentMethod method,
    required String title,
    required String subtitle,
    required Widget icon,
  }) {
    return ListTile(
      contentPadding: EdgeInsets.zero,
      leading: icon,
      title: Text(title, style: TextStyle(fontWeight: FontWeight.bold)),
      subtitle: Text(subtitle),
      trailing: Radio<PaymentMethod>(
        activeColor: AppColors.kPrimaryColor,
        value: method,
        groupValue: _selectedMethod,
        onChanged: (value) {
          setState(() {
            _selectedMethod = value!;
          });
        },
      ),
      onTap: () {
        setState(() {
          _selectedMethod = method;
        });
      },
    );
  }
}
