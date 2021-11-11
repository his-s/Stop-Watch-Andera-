import 'package:flutter/material.dart';

class ClockHand extends StatelessWidget {
  const ClockHand(
      {Key? key,
      required this.handThickness,
      required this.handheigth,
      required this.handColor,
      required this.rotationZAngel})
      : super(key: key);
  final double handThickness;
  final double handheigth;
  final Color handColor;
  final double rotationZAngel;
  @override
  Widget build(BuildContext context) {
    return Transform(
      transform: Matrix4.identity()
        ..translate(-handThickness / 2, 0, 0)
        ..rotateZ(rotationZAngel),
      alignment: Alignment.topCenter,
      child: Container(
        color: handColor,
        width: handThickness,
        height: handheigth,
      ),
    );
  }
}
