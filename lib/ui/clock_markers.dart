import 'dart:math';

import 'package:flutter/material.dart';

class ClockSecondTickMarker extends StatelessWidget {
  const ClockSecondTickMarker(
      {Key? key, required this.seconds, required this.raduis})
      : super(key: key);
  final int seconds;
  final double raduis;
  @override
  Widget build(BuildContext context) {
    final color = seconds % 5 == 0 ? Colors.white : Colors.grey[700];
    const width = 2.0;
    const heigth = 12.0;
    return Transform(
      transform: Matrix4.identity()
        ..translate(-width / 2, -heigth / 2, 0)
        ..rotateZ(
          2 * pi * (seconds / 60),
        )
        ..translate(0.0, raduis - heigth / 2, 0.0),
      alignment: Alignment.center,
      child: Container(
        color: color,
        height: 12,
        width: 2,
      ),
    );
  }
}

class ClockTextMarker extends StatelessWidget {
  const ClockTextMarker(
      {Key? key,
      required this.value,
      required this.maxValue,
      required this.radius})
      : super(key: key);
  final int value;
  final int maxValue;
  final double radius;
  @override
  Widget build(BuildContext context) {
    final color = Colors.white;
    const heigth = 30.0;
    const width = 40.0;
    return Transform(
      transform: Matrix4.identity()
        ..translate(-width / 2, -heigth / 2, 0)
        ..rotateZ(
          pi + 2 * pi * (value / maxValue),
        )
        ..translate(0.0, radius - 35, 0.0)
        ..rotateZ(pi - 2 * pi * (value / maxValue)),
      alignment: Alignment.center,
      child: SizedBox(
        height: heigth,
        width: width,
        child: Text(
          value.toString(),
          style: const TextStyle(
            fontSize: 24,
          ),
          textAlign: TextAlign.center,
        ),
      ),
    );
  }
}
