import 'dart:math';

import 'package:animation_app/ui/clock_hand.dart';
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
        Positioned(
          left: radius,
          top: radius,
          child: ClockHand(
            handThickness: 2,
            handheigth: radius,
            handColor: Colors.orange,
            rotationZAngel: pi + (2 * pi / 60000) * elapsed.inMilliseconds,
          ),
        ),
        Positioned(
          top: radius * 1.3,
          left: 0,
          right: 0,
          child: ElapsedTimeText(
            elapsed: elapsed,
          ),
        ),
      ],
    );
  }
}
