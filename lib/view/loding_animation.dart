import 'package:flutter/material.dart';

class CustomAnimatedLoader extends StatefulWidget {
  @override
  _CustomAnimatedLoaderState createState() => _CustomAnimatedLoaderState();
}

class _CustomAnimatedLoaderState extends State<CustomAnimatedLoader> with TickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<Color?> _colorAnimation;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 2),
    )..repeat(); // Continuous animation

    _colorAnimation = ColorTween(
      begin: Colors.blue,
      end: Colors.red,
    ).animate(_controller);
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: AnimatedBuilder(
        animation: _colorAnimation,
        builder: (context, child) => CircularProgressIndicator(
          valueColor: AlwaysStoppedAnimation(_colorAnimation.value),
        ),
      ),
    );
  }
}
