import 'dart:math';

import 'package:flutter/material.dart';

class AnimationDart extends StatefulWidget {
  @override
  _AnimationState createState() => _AnimationState();
}

class _AnimationState extends State<AnimationDart>
    with SingleTickerProviderStateMixin {
  late final AnimationController _controller = AnimationController(
    duration: const Duration(seconds: 12),
    vsync: this,
  );

  late final Animation<double> opacity = Tween(begin: 0.0, end: 1.0).animate(
    CurvedAnimation(
      parent: _controller,
      curve: Interval(
        0.0,
        0.1,
        curve: Curves.easeIn,
      ),
    ),
  );

  late Animation<Color?> color =
      ColorTween(begin: Colors.amber, end: Colors.red).animate(
    CurvedAnimation(
      parent: _controller,
      curve: Interval(0.1, 0.5, curve: Curves.linear),
    ),
  );

  late final Animation<double> borderRadius =
      Tween(begin: 0.0, end: 60.0).animate(
    CurvedAnimation(
      parent: _controller,
      curve: Interval(
        0.3,
        0.5,
        curve: Curves.easeInOut,
      ),
    ),
  );

  late Animation<double> width = Tween(begin: 120.0, end: 420.0).animate(
    CurvedAnimation(
      parent: _controller,
      curve: Interval(
        0.5,
        0.7,
        curve: Curves.easeInCirc,
      ),
    ),
  );

  late Animation<double> height = Tween(begin: 120.0, end: 800.0).animate(
    CurvedAnimation(
      parent: _controller,
      curve: Interval(
        0.5,
        0.7,
        curve: Curves.easeInCirc,
      ),
    ),
  );

  late Animation<double> rotate = Tween(begin: 0.0, end: pi).animate(
    CurvedAnimation(
      parent: _controller,
      curve: Interval(
        0.7,
        0.8,
        curve: Curves.ease,
      ),
    ),
  );

  late Animation<double> scale = Tween(begin: 1.0, end: 0.5).animate(
    CurvedAnimation(
      parent: _controller,
      curve: Interval(
        0.7,
        0.9,
        curve: Curves.ease,
      ),
    ),
  );

  late Animation<double> translate = Tween(begin: 0.0, end: 40.0).animate(
    CurvedAnimation(
      parent: _controller,
      curve: Interval(
        0.9,
        1.0,
        curve: Curves.ease,
      ),
    ),
  );

  @override
  void initState() {
    super.initState();
    _controller.forward();
  }

  @override
  void dispose() {
    super.dispose();
    _controller.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: _controller,
      builder: (context, child) => Center(
        child: Opacity(
          opacity: opacity.value,
          child: Transform.scale(
            scale: scale.value,
            child: Transform.translate(
              offset: Offset(translate.value, translate.value),
              child: Transform.rotate(
                angle: rotate.value,
                child: Container(
                  alignment: Alignment.center,
                  height: height.value,
                  width: width.value,
                  decoration: BoxDecoration(
                    color: color.value,
                    borderRadius: BorderRadius.circular(borderRadius.value),
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
