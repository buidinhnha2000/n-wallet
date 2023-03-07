import 'dart:math';

import 'package:flutter/material.dart';

import '../../theme/app_color.dart';

class DWalletLoader extends StatefulWidget {
  const DWalletLoader({Key? key}) : super(key: key);

  @override
  State<DWalletLoader> createState() => _DWalletLoaderState();
}

class _DWalletLoaderState extends State<DWalletLoader>
    with SingleTickerProviderStateMixin {
  late final AnimationController controller;
  late final Animation<double> animationRotate;
  late final Animation<double> animationRadiusIn;
  late final Animation<double> animationRadiusOut;

  final double initialRadius = 30.0;
  double radius = 0.0;

  @override
  void initState() {
    super.initState();
    controller =
        AnimationController(vsync: this, duration: const Duration(seconds: 5));

    animationRotate = Tween<double>(begin: 0.0, end: 1.0).animate(
        CurvedAnimation(
            parent: controller,
            curve: const Interval(0.0, 0.25, curve: Curves.linear)));

    animationRadiusIn = Tween<double>(begin: 1.0, end: 0.0).animate(
      CurvedAnimation(
        parent: controller,
        curve: const Interval(0.75, 1.0, curve: Curves.elasticIn),
      ),
    );
    animationRadiusOut = Tween<double>(begin: 0.0, end: 1.0).animate(
      CurvedAnimation(
        parent: controller,
        curve: const Interval(0.0, 0.25, curve: Curves.elasticOut),
      ),
    );
    controller.addListener(() {
      setState(() {
        if (controller.value >= 0.75 && controller.value <= 1.0) {
          radius = animationRadiusIn.value * initialRadius;
        } else if (controller.value >= 0.0 && controller.value <= 0.25) {
          radius = animationRadiusOut.value * initialRadius;
        }
      });
    });
    controller.repeat();
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.primaryNeonGreen.withOpacity(0.4),
      body: Center(
        child: RotationTransition(
          turns: animationRotate,
          child: Stack(
            children: [
              const Dot(
                radius: 30.0,
                color: AppColors.primaryGreen,
              ),
              Transform.translate(
                offset: Offset(radius * cos(pi / 4), radius * sin(pi / 4)),
                child: const Dot(radius: 5.0, color: Colors.redAccent),
              ),
              Transform.translate(
                offset:
                    Offset(radius * cos(2 * pi / 4), radius * sin(2 * pi / 4)),
                child: const Dot(radius: 5.0, color: Colors.blue),
              ),
              Transform.translate(
                offset:
                    Offset(radius * cos(2 * pi / 4), radius * sin(2 * pi / 4)),
                child: const Dot(radius: 5.0, color: Colors.amber),
              ),
              Transform.translate(
                offset:
                    Offset(radius * cos(3 * pi / 4), radius * sin(3 * pi / 4)),
                child: const Dot(radius: 5.0, color: Colors.teal),
              ),
              Transform.translate(
                offset:
                    Offset(radius * cos(4 * pi / 4), radius * sin(4 * pi / 4)),
                child: const Dot(radius: 5.0, color: Colors.deepPurpleAccent),
              ),
              Transform.translate(
                offset:
                    Offset(radius * cos(5 * pi / 4), radius * sin(5 * pi / 4)),
                child: const Dot(radius: 5.0, color: Colors.pink),
              ),
              Transform.translate(
                offset:
                    Offset(radius * cos(6 * pi / 4), radius * sin(6 * pi / 4)),
                child: const Dot(radius: 5.0, color: Colors.indigo),
              ),
              Transform.translate(
                offset:
                    Offset(radius * cos(7 * pi / 4), radius * sin(7 * pi / 4)),
                child: const Dot(radius: 5.0, color: Colors.blueAccent),
              ),
              Transform.translate(
                offset:
                    Offset(radius * cos(8 * pi / 4), radius * sin(8 * pi / 4)),
                child: const Dot(radius: 5.0, color: Colors.brown),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class Dot extends StatelessWidget {
  final double radius;
  final Color color;

  const Dot({super.key, required this.radius, required this.color});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        width: radius,
        height: radius,
        decoration: BoxDecoration(color: color, shape: BoxShape.circle),
      ),
    );
  }
}
