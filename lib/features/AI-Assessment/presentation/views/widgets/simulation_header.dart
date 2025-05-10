
import 'package:evolvify/core/widgets/cutsom_arrow_ios.dart';
import 'package:flutter/material.dart';


class SimulationHeader extends StatelessWidget {
  const SimulationHeader({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(12.0),
      child: Container(
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(11),
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withValues(alpha: 0.2),
              spreadRadius: 7,
              blurRadius: 6,
              offset: Offset(0, 3),
            ),
          ],
        ),
        child: Row(
          children: [
            CutsomArrowios(),
            const SizedBox(width: 8),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  'Real-time Emotion Analysis',
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                ),
                SizedBox(height: 4),
                Row(
                  children: [
                    const Icon(Icons.fiber_manual_record, color: Colors.red),
                    SizedBox(width: 4),
                    const Text(
                      '00:12:36',
                      style: TextStyle(color: Colors.grey),
                    ),
                  ],
                ),
                SizedBox(height: 4),
              ],
            ),
          ],
        ),
      ),
    );
  }
}