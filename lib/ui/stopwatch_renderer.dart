import 'dart:math';

import 'package:animation_app/ui/elapsed_time_text.dart';
import 'package:flutter/material.dart';

class StopWatchRenderer extends StatelessWidget {
  const StopWatchRenderer({Key? key, required this.elapsed}) : super(key: key);
  final Duration elapsed;
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Transform(
          transform: Matrix4.identity()
            ..translate(50.0, 0.0, 0.0)
            ..rotateZ(pi / 4),
          alignment: Alignment.center,
          child: Container(
            color: Colors.indigo,
          ),
        ),
        // ElapsedTimeText(
        //   elapsed: elapsed,
        // ),
      ],
    );
  }
}
