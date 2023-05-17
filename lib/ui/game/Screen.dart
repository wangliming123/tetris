import 'dart:math';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tetris/base/values.dart';
import 'package:tetris/ui/game/Game.dart';
import 'package:tetris/ui/game/GameState.dart';
import 'package:vector_math/vector_math_64.dart';

import '../main/main_controller.dart';

class Screen extends StatelessWidget {
  final double width;

  const Screen({
    Key? key,
    required this.width,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final gameState = Get.find<MainController>().gameState;
    final playerPanelWidth = width * 0.6;
    return Obx(() {
      return Shake(
        shake: gameState.states.value == GameStates.drop,
        child: Container(
          width: width,
          height: (playerPanelWidth - 6) * 2 + 6,
          color: ColorRes.screenBackground,
          child: gameState.material.value == null ? Container() : getScreenChild(playerPanelWidth),
        ),
      );
    });
  }

  Widget getScreenChild(double playerPanelWidth) {
    return GameView(width: playerPanelWidth);
  }
}

class Shake extends StatefulWidget {
  final Widget child;

  final bool shake;

  const Shake({
    Key? key,
    required this.shake,
    required this.child,
  }) : super(key: key);

  @override
  State<StatefulWidget> createState() {
    return _ShakeState();
  }
}

class _ShakeState extends State<Shake> with TickerProviderStateMixin {
  late AnimationController _controller;

  @override
  void initState() {
    _controller = AnimationController(
        vsync: this, duration: const Duration(milliseconds: 150))
      ..addListener(() {
        setState(() {});
      });
    super.initState();
  }

  @override
  void didUpdateWidget(covariant Shake oldWidget) {
    if (widget.shake) {
      _controller.forward(from: 0);
    }
    super.didUpdateWidget(oldWidget);
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Transform(
      transform: Matrix4.translation(_getTranslation()),
      child: widget.child,
    );
  }

  Vector3 _getTranslation() {
    double progress = _controller.value;
    double offset = sin(progress * pi) * 1.5;
    return Vector3(0, offset, 0.0);
  }
}
