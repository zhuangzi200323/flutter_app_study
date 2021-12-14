import 'dart:async';

import 'package:flutter/material.dart';

/// https://github.com/apgapg/avatar_glow
class AvatarGlow extends StatefulWidget {
  final bool repeat;
  final Duration duration;
  final double endRadius;
  final Duration repeatPauseDuration;
  final Widget child;
  final bool showTwoGlows;
  final Color? glowColor;
  final Duration startDelay;

  AvatarGlow({
    required this.endRadius,
    required this.child,
    this.duration = Duration.zero,
    this.repeat = true,
    this.repeatPauseDuration = Duration.zero,
    this.showTwoGlows = true,
    this.glowColor,
    this.startDelay = Duration.zero,
  });

  @override
  createState() => _AvatarGlowState();
}

class _AvatarGlowState extends State<AvatarGlow>
    with SingleTickerProviderStateMixin {
  late Animation<double> smallDiscAnimation;
  late Animation<double> bigDiscAnimation;
  late Animation<double> alphaAnimation;
  late AnimationController controller;

  @override
  void initState() {
    super.initState();
    controller = AnimationController(
        duration: widget.duration ?? Duration(milliseconds: 2000), vsync: this);
    final Animation curve =
        CurvedAnimation(parent: controller, curve: Curves.decelerate);
    smallDiscAnimation = Tween(
            begin: (widget.endRadius * 2) / 6,
            end: (widget.endRadius * 2) * (3 / 4))
        .animate(curve as Animation<double>)
          ..addListener(() {
            setState(() {});
          });
    bigDiscAnimation =
        Tween(begin: 0.0, end: (widget.endRadius * 2)).animate(curve)
          ..addListener(() {
            setState(() {});
          });
    alphaAnimation = Tween(begin: 0.30, end: 0.0).animate(controller);
    controller.addStatusListener((_) async {
      if (controller.status == AnimationStatus.completed) {
        await Future.delayed(
            widget.repeatPauseDuration ?? Duration(milliseconds: 100));
        if (mounted && widget.repeat) {
          controller.reset();
          controller.forward();
        }
      }
    });
    startAnimation();
  }

  void startAnimation() async {
    if (widget.startDelay != null) {
      await Future.delayed(widget.startDelay);
      if (mounted) controller.forward();
    } else {
      controller.forward();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
        height: widget.endRadius * 2,
        width: widget.endRadius * 2,
        child: Stack(alignment: Alignment.center, children: <Widget>[
          Container(
              height: bigDiscAnimation.value,
              width: bigDiscAnimation.value,
              child: SizedBox(),
              decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: (widget.glowColor ?? Colors.white)
                      .withOpacity(alphaAnimation.value))),
          Visibility(
              visible: widget.showTwoGlows,
              child: Container(
                  height: smallDiscAnimation.value,
                  width: smallDiscAnimation.value,
                  child: SizedBox(),
                  decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color: (widget.glowColor ?? Colors.white)
                          .withOpacity(alphaAnimation.value)))),
          widget.child
        ]));
  }

  @override
  void dispose() {
    controller?.dispose();
    super.dispose();
  }
}
