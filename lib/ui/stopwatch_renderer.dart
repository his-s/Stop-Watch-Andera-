import 'dart:math';

import 'package:animation_app/ui/elapsed_time_text.dart';
import 'package:flutter/material.dart';

class StopWatchRenderer extends StatelessWidget {
  const StopWatchRenderer(
      {Key? key, required this.elapsed, required this.radius})
      : super(key: key);
  final Duration elapsed;
  final double radius;
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          decoration: BoxDecoration(
            border: Border.all(color: Colors.orange, width: 3),
            borderRadius: BorderRadius.circular(radius),
          ),
        ),
        // ElapsedTimeText(
        //   elapsed: elapsed,
        // ),
      ],
    );
  }
}
