import 'dart:math';

import 'package:flutter/material.dart';

class ChartBar extends StatefulWidget {
  const ChartBar({super.key});

  @override
  State<ChartBar> createState() => _ChartBarState();
}

class _ChartBarState extends State<ChartBar>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _heightAnimation;
  late Animation<Color?> _colorAnimation;
  final Random _random = Random();

  @override
  void initState() {
    super.initState();

    _controller = AnimationController(
      vsync: this,
      duration: Duration(milliseconds: 1000 + _random.nextInt(1000)),
    );

    double beginHeight = 10.0 + _random.nextInt(20);
    double endHeight = 100.0 + _random.nextInt(200);

    _heightAnimation = Tween<double>(
      begin: beginHeight,
      end: endHeight,
    ).animate(CurvedAnimation(parent: _controller, curve: Curves.easeInOut));

    _colorAnimation = ColorTween(
      begin: Colors.primaries[_random.nextInt(Colors.primaries.length)],
      end: Colors.primaries[_random.nextInt(Colors.primaries.length)],
    ).animate(CurvedAnimation(parent: _controller, curve: Curves.easeInOut));
    _controller.repeat(reverse: true);
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: _controller,
      builder: (context, child) {
        return Container(
          width: 20,
          height: _heightAnimation.value,
          decoration: BoxDecoration(
            color: _colorAnimation.value,
            borderRadius: BorderRadius.zero,
          ),
        );
      },
    );
  }
}
