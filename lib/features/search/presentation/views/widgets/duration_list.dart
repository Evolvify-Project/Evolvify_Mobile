import 'package:evolvify/features/search/presentation/views/widgets/filter_button.dart';
import 'package:flutter/material.dart';

class DurationList extends StatelessWidget {
  DurationList({super.key});

  final List durationList = ['0 - 1 Hour', '1 - 3 Hour', '+3 Hour'];
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 38,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: durationList.length,
        itemBuilder: (context, index) {
          return FilterButton(text: durationList[index]);
        },
      ),
    );
  }
}
