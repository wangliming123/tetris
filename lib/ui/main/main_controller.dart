import 'dart:ui';

import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:tetris/base/base_getx_controller.dart';

import '../game/GameState.dart';
import 'main_state.dart';

class MainBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => MainController());
  }
}

class MainController extends BaseGetXController {
  final MainState state = MainState();
  final GameState gameState = GameState();

  @override
  void initData() {

    super.initData();
    _loadMaterial();
  }

  void _loadMaterial() async {
    if (gameState.material.value != null) {
      return;
    }
    final bytes = await rootBundle.load("assets/material.png");
    final codec = await instantiateImageCodec(bytes.buffer.asUint8List());
    final frame = await codec.getNextFrame();
    gameState.material.value = frame.image;


  }

}
