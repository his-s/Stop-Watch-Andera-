import 'dart:async';
import 'package:animation_app/ui/elapsed_time_text.dart';
import 'package:animation_app/ui/reset_button.dart';
import 'package:animation_app/ui/start_stop_button.dart';
import 'package:animation_app/ui/stopwatch_renderer.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';

class Stopwatch extends StatefulWidget {
  @override
  _StopwatchState createState() => _StopwatchState();
}

class _StopwatchState extends State<Stopwatch>
    with SingleTickerProviderStateMixin {
  Duration _prevElapsed = Duration.zero;
  Duration _currentlyElapsed = Duration.zero;
  Duration get _eplapsed => _prevElapsed + _currentlyElapsed;
  bool _isRuning = false;
  late final Ticker _ticker;
  @override
  void initState() {
    super.initState();
    _ticker = createTicker((elapsed) {
      setState(() {
        _currentlyElapsed = elapsed;
      });
    });
  }

  @override
  void dispose() {
    _ticker.stop();
    super.dispose();
  }

  void _toggleStart() {
    setState(() {
      _isRuning = !_isRuning;
    });
    if (_isRuning) {
      _ticker.start();
    } else {
      _ticker.stop();
      _prevElapsed += _currentlyElapsed;
      _currentlyElapsed = Duration.zero;
    }
  }

  void _reset() {
    _ticker.stop();
    setState(() {
      _isRuning = false;
      _prevElapsed = Duration.zero;
      _currentlyElapsed = Duration.zero;
    });
  }

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(builder: (context, constrains) {
      final radius = constrains.maxWidth / 2;
      return Stack(
        children: [
          StopWatchRenderer(elapsed: _eplapsed, radius: radius),
          Align(
            alignment: Alignment.bottomLeft,
            child: SizedBox(
              width: 80,
              height: 80,
              child: ResetButton(
                onPressed: _reset,
              ),
            ),
          ),
          Align(
            alignment: Alignment.bottomRight,
            child: SizedBox(
              width: 80,
              height: 80,
              child: StartStopButton(
                onPressed: _toggleStart,
                isRunning: _isRuning,
              ),
            ),
          ),
        ],
      );
    });
  }
}
