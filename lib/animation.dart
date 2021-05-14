import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class AnimationDart extends StatefulWidget {
  @override
  _AnimationState createState() => _AnimationState();
}

class _AnimationState extends State<AnimationDart>
    with SingleTickerProviderStateMixin {
  late final AnimationController _controller = AnimationController(
    duration: const Duration(seconds: 5),
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
  late Animation<Color?> color =
      ColorTween(begin: Colors.amber, end: Colors.red).animate(
    CurvedAnimation(
      parent: _controller,
      curve: Interval(0.2, 0.5, curve: Curves.linear),
    ),
  );

  late Animation<double> sizeNew = Tween(begin: 1.0, end: 2.0).animate(
    CurvedAnimation(
      parent: _controller,
      curve: Interval(
        0.5,
        0.7,
        curve: Curves.bounceIn,
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
          child: Container(
            alignment: Alignment.center,
            height: 120.0 * sizeNew.value,
            width: 120 * sizeNew.value,
            decoration: BoxDecoration(
              color: color.value,
              borderRadius: BorderRadius.circular(borderRadius.value),
            ),
          ),
        ),
      ),
    );
  }
}
