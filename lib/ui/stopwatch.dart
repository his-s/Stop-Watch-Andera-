import 'dart:async';
import 'package:animation_app/ui/elapsed_time_text.dart';
import 'package:flutter/material.dart';

class Stopwatch extends StatefulWidget {
  @override
  _StopwatchState createState() => _StopwatchState();
}

class _StopwatchState extends State<Stopwatch> {
  Duration _eplapsed = Duration.zero;
  late DateTime _initialTime;
  late final Timer _timer;
  @override
  void initState() {
    super.initState();
    _initialTime = DateTime.now();
    _timer = Timer.periodic(const Duration(milliseconds: 50), (timer) {
      final now = DateTime.now();
      setState(() {
       
        _eplapsed = now.difference(_initialTime);
      });
    });
  }

  @override
  void dispose() {
    _timer.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return ElapsedTimeText(
      elapsed: _eplapsed,
    );
  }
}
