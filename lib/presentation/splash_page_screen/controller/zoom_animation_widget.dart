import 'dart:async';

import 'package:flutter/material.dart';

class ZoomAnimationWidget extends StatefulWidget {
  final Widget child;

  ZoomAnimationWidget({required this.child});

  @override
  _ZoomAnimationWidgetState createState() => _ZoomAnimationWidgetState();
}

class _ZoomAnimationWidgetState extends State<ZoomAnimationWidget> {
  double _height = 0;
  double _width = 0;

  Timer? _timer;

  void _startTimer() {
    _timer = Timer.periodic(Duration(milliseconds: 1700), (timer) {
      setState(() {
        _height = _height == 0 ? 300 : 0;
        _width = _width == 0 ? 300 : 0;
      });
    });
  }

  @override
  void initState() {
    super.initState();
    _startTimer();
  }

  @override
  void dispose() {
    _timer?.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedContainer(
      duration: Duration(milliseconds: 1700),
      curve: Curves.easeInOut,
      height: _height,
      width: _width,
      child: widget.child,
    );
  }
}
