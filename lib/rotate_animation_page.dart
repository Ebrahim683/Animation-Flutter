import 'dart:math' show pi;

import 'package:animation_flutter/box_shadow.dart';
import 'package:flutter/material.dart';

class RotateAnimationPage extends StatefulWidget {
  const RotateAnimationPage({super.key});

  @override
  State<RotateAnimationPage> createState() => _RotateAnimationPageState();
}

class _RotateAnimationPageState extends State<RotateAnimationPage>
    with SingleTickerProviderStateMixin {
  AnimationController? _animationController;
  Animation<double>? _animation;
  @override
  void initState() {
    super.initState();
    _animationController = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 2),
    );
    _animation =
        Tween<double>(begin: 0.0, end: pi * 2).animate(_animationController!);
    _animationController!.repeat();
  }

  @override
  void dispose() {
    super.dispose();
    _animationController?.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black87,
      body: Center(
        child: AnimatedBuilder(
            animation: _animationController!,
            builder: (context, snapshot) {
              return Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Transform(
                    alignment: Alignment.center,
                    transform: Matrix4.identity()..rotateY(_animation!.value),
                    child: Container(
                      height: 100,
                      width: 100,
                      decoration: BoxDecoration(
                        color: Colors.grey.shade200,
                        borderRadius: BorderRadius.circular(20),
                        boxShadow: boxShadow,
                      ),
                      child: const Center(
                        child: FlutterLogo(
                          size: 50,
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 50,
                  ),
                  Transform(
                    alignment: Alignment.center,
                    transform: Matrix4.identity()..rotateZ(_animation!.value),
                    child: Container(
                      height: 100,
                      width: 100,
                      decoration: BoxDecoration(
                        color: Colors.grey.shade200,
                        borderRadius: BorderRadius.circular(20),
                        boxShadow: boxShadow,
                      ),
                      child: const Center(
                        child: FlutterLogo(
                          size: 50,
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 50,
                  ),
                  Transform(
                    alignment: Alignment.center,
                    transform: Matrix4.identity()..rotateX(_animation!.value),
                    child: Container(
                      height: 100,
                      width: 100,
                      decoration: BoxDecoration(
                        color: Colors.grey.shade200,
                        borderRadius: BorderRadius.circular(20),
                        boxShadow: boxShadow,
                      ),
                      child: const Center(
                        child: FlutterLogo(
                          size: 50,
                        ),
                      ),
                    ),
                  ),
                ],
              );
            }),
      ),
    );
  }
}
